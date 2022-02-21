import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatelessWidget {
  
  const WelcomeScreen({ Key? key }) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      navigateAfterSeconds: LoginPage(),
      title:  Text('ABC',textScaleFactor: 2,),
      image:  Image(image: AssetImage('assets/logo.png'),),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.black54,
    );
  }
}
