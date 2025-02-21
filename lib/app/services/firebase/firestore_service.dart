import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create a new document
  Future<bool> createDocument(
    String collectionName,
    Map<String, dynamic> data,
  ) async {
    try {
      final docRef = await _firestore.collection(collectionName).add(data);
      await docRef.update({'id': docRef.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Create a new document with custom ID
  Future<bool> createDocumentWithCustomId({
    required String collectionName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(id).set(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Read a document by ID
  Future<Map<String, dynamic>?> getDocumentById(
      String collectionName, String id) async {
    try {
      final DocumentSnapshot doc =
          await _firestore.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return doc.data()! as Map<String, dynamic>;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  /// Update a document
  Future<bool> updateDocument(
      String collectionName, String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc(id).update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Delete a document
  Future<bool> deleteDocument(String collectionName, String id) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get documents by field
  Future<List<Map<String, dynamic>>> getCollectionById({
    required String collectionName,
    required String value,
    String field = 'id',
  }) async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection(collectionName)
          .where(field, isEqualTo: value)
          .get();
      return querySnapshot.docs
          .map((doc) => doc.data()! as Map<String, dynamic>)
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Get documents by field as a stream
  Stream<QuerySnapshot> getCollectionByFieldStream({
    required String collectionName,
    required String field,
    required String value,
  }) {
    return _firestore
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .snapshots();
  }
}
