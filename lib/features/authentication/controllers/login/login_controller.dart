import 'package:shopease/data/repositories/authentication/authentication_repository.dart';
import 'package:shopease/features/personalization/controllers/user_controller.dart';
import 'package:shopease/navigation_menu.dart';
import 'package:shopease/utils/constants/image_strings.dart';
import 'package:shopease/utils/helpers/network_manager.dart';
import 'package:shopease/utils/popups/full_screen_loader.dart';
import 'package:shopease/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController(); 

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read<String>('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read<String>('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //Email and password sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Loggin You In", TImages.creditCard);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // TODO(Firebase): guest entry while Firebase.initializeApp() is commented out
      if (!AuthenticationRepository.firebaseEnabled) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: "Firebase Skipped",
          message: "Continuing as a guest for now.",
        );
        Get.offAll(() => NavigationMenu());
        return;
      }

      //login user using email and password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  //Google sign in authentication
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Logging You In", TImages.acerlogo);

      // TODO(Firebase): Google sign-in needs Firebase -> skip while it is commented out
      if (!AuthenticationRepository.firebaseEnabled) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: "Firebase Skipped",
          message: "Google sign-in is unavailable, sign in with email instead.",
        );
        return;
      }

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google Sign In
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
