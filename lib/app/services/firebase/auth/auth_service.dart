import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/widgets.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User?> firebaseUser = Rxn<User?>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  /// Public method to get the initial screen route
  String getInitialScreen() {
    final user = _auth.currentUser;
    if (user == null) {
      return Routes.LOGIN;
    } else {
      return Routes.HOME;
    }
  }

  /// Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          CustomSnackBars.showErrorSnackBar(
            AppLocalizations.of(Get.context!)!.no_user_found,
          );
        case 'wrong-password':
          CustomSnackBars.showErrorSnackBar(
            AppLocalizations.of(Get.context!)!.wrong_password,
          );
        default:
          CustomSnackBars.showErrorSnackBar(
            AppLocalizations.of(Get.context!)!.unknown_error,
          );
      }
      return null;
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(e.toString());
      return null;
    }
  }

  /// Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          Get.snackbar(
              'Error', AppLocalizations.of(Get.context!)!.email_in_use);
        case 'weak-password':
          Get.snackbar(
              'Error', AppLocalizations.of(Get.context!)!.weak_password);
        default:
          Get.snackbar('Error',
              e.message ?? AppLocalizations.of(Get.context!)!.unknown_error);
      }
      return null;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success',
          AppLocalizations.of(Get.context!)!.password_reset_email_sent);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          Get.snackbar(
              'Error', AppLocalizations.of(Get.context!)!.no_user_found);
        default:
          Get.snackbar('Error',
              e.message ?? AppLocalizations.of(Get.context!)!.unknown_error);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('Success', AppLocalizations.of(Get.context!)!.signed_out);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
