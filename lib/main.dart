import 'package:shopease/app.dart';
import 'package:shopease/data/repositories/authentication/authentication_repository.dart';
// TODO(Firebase): re-enable these imports when Firebase is switched back on
// import 'package:shopease/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding---------------------------------------------------
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Getx Local Strorage---------------------------------------------------
  await GetStorage.init();

  // TODO: Init Payment Methods---------------------------------------------------

  // Await Native Splash------  ---------------------------------------------
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase (skipped for now) ---------------------------------------------------
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Authentication Repository runs without Firebase (guest mode redirect)-------------------
  Get.put(AuthenticationRepository());

  // Load all material design /themes/localization/ Bindings

  runApp(const App());
}
