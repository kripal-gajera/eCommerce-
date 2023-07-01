import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home_page/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        color: Colors.black87,
        debugShowCheckedModeBanner: false,
        home: SpleshScreen()
    );
  }
}

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/image/happy shopping.jpg',
            fit: BoxFit.fitWidth,
          )
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: Home(),    //userfind(),
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
