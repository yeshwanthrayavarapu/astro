/// Application-wide constants for LifePattern.
abstract final class AppConstants {
  /// App name displayed in the UI.
  static const String appName = 'LifePattern';

  /// Firestore collection names.
  static const String usersCollection = 'users';
  static const String profilesCollection = 'profiles';
  static const String contentCollection = 'content';
  static const String bondsCollection = 'bonds';

  /// Shared preferences keys.
  static const String prefOnboardingComplete = 'onboarding_complete';
  static const String prefThemeMode = 'theme_mode';
  static const String prefSelectedTimezone = 'selected_timezone';
}
