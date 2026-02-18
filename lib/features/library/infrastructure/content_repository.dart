import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_pattern/features/library/domain/content_collection.dart';
import 'package:life_pattern/features/library/domain/content_item.dart';
import 'package:life_pattern/features/library/domain/reading_progress.dart';

class ContentRepository {
  final FirebaseFirestore _firestore;

  ContentRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  // ---------------------------------------------------------------------------
  // Collections
  // ---------------------------------------------------------------------------

  Stream<List<ContentCollection>> watchCollections() {
    return _firestore
        .collection('content_collections')
        .orderBy('sortOrder')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ContentCollection.fromJson(doc.data()))
            .toList());
  }

  Future<ContentCollection?> getCollection(String id) async {
    final doc =
        await _firestore.collection('content_collections').doc(id).get();
    if (!doc.exists) return null;
    return ContentCollection.fromJson(doc.data()!);
  }

  // ---------------------------------------------------------------------------
  // Content Items
  // ---------------------------------------------------------------------------

  Stream<List<ContentItem>> watchCollectionItems(String collectionId) {
    return _firestore
        .collection('content_items')
        .where('collectionId', isEqualTo: collectionId)
        .orderBy('sortOrder')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ContentItem.fromJson(doc.data()))
            .toList());
  }

  Future<ContentItem?> getItem(String id) async {
    final doc = await _firestore.collection('content_items').doc(id).get();
    if (!doc.exists) return null;
    return ContentItem.fromJson(doc.data()!);
  }

  // ---------------------------------------------------------------------------
  // Reading Progress
  // ---------------------------------------------------------------------------

  Stream<ReadingProgress?> watchReadingProgress(String userId, String itemId) {
    return _firestore
        .collection('reading_progress')
        .doc(userId)
        .collection('items')
        .doc(itemId)
        .snapshots()
        .map((doc) {
      if (!doc.exists) return null;
      return ReadingProgress.fromJson(doc.data()!);
    });
  }

  Future<void> updateReadingProgress(ReadingProgress progress) async {
    await _firestore
        .collection('reading_progress')
        .doc(progress.userId)
        .collection('items')
        .doc(progress.contentItemId)
        .set(progress.toJson(), SetOptions(merge: true));
  }

  // ---------------------------------------------------------------------------
  // Seeding (Admin)
  // ---------------------------------------------------------------------------

  Future<void> seedCollection(
      ContentCollection collection, List<ContentItem> items) async {
    final batch = _firestore.batch();

    final colRef =
        _firestore.collection('content_collections').doc(collection.id);
    batch.set(colRef, collection.toJson());

    for (final item in items) {
      final itemRef = _firestore.collection('content_items').doc(item.id);
      batch.set(itemRef, item.toJson());
    }

    await batch.commit();
  }
}
