import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_screen_task/core/utils/custom_snack_bar.dart';

class FirebaseCurdHelper {
  // Private constructor
  FirebaseCurdHelper._();

  // Singleton instance
  static FirebaseCurdHelper get instance => FirebaseCurdHelper._();

  /// Create Document
  Future<void> createDocument(
          {required CollectionReference<Map<String, dynamic>> collection,
          required String docId,
          required Map<String, dynamic> data}) async =>
      await processFirebaseRequest(() => collection.doc(docId).set(data));

  /// Read Single Document
  Future<DocumentSnapshot<Map<String, dynamic>>?> readSingleDocument(
          {required CollectionReference<Map<String, dynamic>> collection,
          required String docId}) async =>
      await processFirebaseRequest(() => collection.doc(docId).get());

  /// Read all documents
  Future<QuerySnapshot<Map<String, dynamic>>?> readAllDocument(
          {required CollectionReference<Map<String, dynamic>>
              collection}) async =>
      await processFirebaseRequest(() async => await collection.get());

  /// Update Document
  Future<void> updateDocument(
          {required CollectionReference<Map<String, dynamic>> collection,
          required String docId,
          required Map<String, dynamic> data}) async =>
      await processFirebaseRequest(() => collection.doc(docId).update(data));

  /// Delete Document
  Future<void> deleteDocument(
          {required CollectionReference<Map<String, dynamic>> collection,
          required String docId}) async =>
      await processFirebaseRequest(() => collection.doc(docId).delete());

  /// Read All Documents (Snapshot)
  Stream<QuerySnapshot> readAllDocuments(
          {required CollectionReference<Map<String, dynamic>> collection}) =>
      collection.snapshots();

  /// This method is responsible for executing and handling Firebase operations
  Future<T?> processFirebaseRequest<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseException catch (e) {
      final errorMessage = getFirestoreErrorMessage(e);
      CustomSnackBar.error(errorMessage);
      return null; // or handle as needed
    } catch (e) {
      CustomSnackBar.error(e.toString());
      return null; // or handle as needed
    }
  }

  /// Method to get a user-friendly message from FirebaseException
  String getFirestoreErrorMessage(FirebaseException e) {
    switch (e.code) {
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'unknown':
        return 'An unknown error occurred.';
      case 'invalid-argument':
        return 'Invalid argument provided.';
      case 'deadline-exceeded':
        return 'The deadline was exceeded, please try again.';
      case 'not-found':
        return 'Requested document was not found.';
      case 'already-exists':
        return 'The document already exists.';
      case 'permission-denied':
        return 'You do not have permission to execute this operation.';
      case 'resource-exhausted':
        return 'Resource limit has been exceeded.';
      case 'failed-precondition':
        return 'The operation failed due to a precondition.';
      case 'aborted':
        return 'The operation was aborted, please try again.';
      case 'out-of-range':
        return 'The operation was out of range.';
      case 'unimplemented':
        return 'This operation is not implemented or supported yet.';
      case 'internal':
        return 'Internal error occurred.';
      case 'unavailable':
        return 'The service is currently unavailable, please try again later.';
      case 'data-loss':
        return 'Data loss occurred, please try again.';
      case 'unauthenticated':
        return 'You are not authenticated, please login and try again.';
      default:
        return 'An unexpected error occurred, please try again.';
    }
  }
}
