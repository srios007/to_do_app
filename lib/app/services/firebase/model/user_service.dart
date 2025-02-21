import 'package:get/get.dart';
import '../../../models/user/user_model.dart';
import '../../../utils/utils.dart';
import '../firestore_service.dart';

class UserService extends GetxService {
  final _firestoreService = Get.put(FirestoreService());
  final userReference = FirestoreReferences.users;
  final firebaseUser = Rxn<UserModel?>();

  /// Create a new user
  Future<bool> createUser(UserModel user) async {
    return _firestoreService.createDocumentWithCustomId(
      collectionName: userReference,
      id: user.id!,
      data: user.toJson(),
    );
  }

  /// Read a user by ID
  Future<UserModel?> getUserById(String id) async {
    final data = await _firestoreService.getDocumentById(userReference, id);
    if (data != null) {
      firebaseUser.value = UserModel.fromJson(data);
      return UserModel.fromJson(data);
    }
    return null;
  }

  // Update a user
  Future<bool> updateUser(UserModel user) async {
    return _firestoreService.updateDocument(
      userReference,
      user.id!,
      user.toJson(),
    );
  }

  // Delete a user
  Future<bool> deleteUser(String id) async {
    return _firestoreService.deleteDocument(userReference, id);
  }
}
