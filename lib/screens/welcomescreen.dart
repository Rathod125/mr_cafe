import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: Color(0xFFEADBCC),
      navigateAfterSeconds: LoginPage(),
      title: const Text(
        'ABC',
        textScaleFactor: 2,
      ),
      image: const Image(
        image: AssetImage('assets/logo.png'),
      ),
      loadingText: const Text("Loading"),
      photoSize: 200.0,
      loaderColor: Colors.black54,
    );
  }
}
