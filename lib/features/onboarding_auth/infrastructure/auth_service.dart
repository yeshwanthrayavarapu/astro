import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:life_pattern/core/errors/app_exception.dart';

/// Handles all Firebase Auth operations and Firestore user document upserts.
class AuthService {
  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  /// Stream of auth state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Current user (nullable).
  User? get currentUser => _auth.currentUser;

  // ---------------------------------------------------------------------------
  // Sign Up
  // ---------------------------------------------------------------------------

  Future<UserCredential> signUpWithEmail(
    String email,
    String password,
    String name,
    String? phoneNumber,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await credential.user?.updateDisplayName(name.trim());
      await _upsertUserDocument(
        credential.user!,
        displayName: name.trim(),
        phoneNumber: phoneNumber?.trim(),
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // Sign In
  // ---------------------------------------------------------------------------

  Future<UserCredential> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await _upsertUserDocument(credential.user!);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled — throw a recognisable exception
        throw const AuthException('Google sign-in was cancelled.');
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      await _upsertUserDocument(userCredential.user!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  Future<UserCredential> signInAnonymously() async {
    try {
      final credential = await _auth.signInAnonymously();
      await _upsertUserDocument(credential.user!);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // Password Reset
  // ---------------------------------------------------------------------------

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseError(e);
    }
  }

  // ---------------------------------------------------------------------------
  // Sign Out
  // ---------------------------------------------------------------------------

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // ---------------------------------------------------------------------------
  // Firestore upsert
  // ---------------------------------------------------------------------------

  Future<void> _upsertUserDocument(
    User user, {
    String? displayName,
    String? phoneNumber,
  }) async {
    final ref = _firestore.collection('users').doc(user.uid);
    final now = Timestamp.now();

    final snapshot = await ref.get();
    if (!snapshot.exists) {
      // First time — create full document
      await ref.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': displayName ?? user.displayName,
        'photoUrl': user.photoURL,
        'phoneNumber': phoneNumber,
        'createdAt': now,
        'lastLoginAt': now,
        'isAnonymous': user.isAnonymous,
        'isPremium': false,
        'onboardingCompleted': false,
      });
    } else {
      // Returning user — update login time and mutable fields
      await ref.update({
        'lastLoginAt': now,
        'email': user.email,
        'displayName':
            displayName ?? user.displayName ?? snapshot['displayName'],
        'photoUrl': user.photoURL ?? snapshot['photoUrl'],
        'phoneNumber': phoneNumber ?? snapshot.data()?['phoneNumber'],
        'isAnonymous': user.isAnonymous,
      });
    }
  }

  Future<void> completeOnboarding(String uid) async {
    await _firestore.collection('users').doc(uid).update({
      'onboardingCompleted': true,
    });
  }

  // ---------------------------------------------------------------------------
  // Error mapping
  // ---------------------------------------------------------------------------

  AuthException _mapFirebaseError(FirebaseAuthException e) {
    final message = switch (e.code) {
      'email-already-in-use' => 'An account with this email already exists.',
      'invalid-email' => 'Please enter a valid email address.',
      'weak-password' => 'Password must be at least 6 characters.',
      'wrong-password' => 'Incorrect password. Try again or reset it.',
      'user-not-found' => 'No account found with this email.',
      'user-disabled' => 'This account has been disabled.',
      'too-many-requests' => 'Too many attempts. Please try again later.',
      'network-request-failed' =>
        'Check your internet connection and try again.',
      'invalid-credential' => 'Incorrect email or password.',
      _ => e.message ?? 'An unexpected error occurred.',
    };
    return AuthException(message);
  }
}
