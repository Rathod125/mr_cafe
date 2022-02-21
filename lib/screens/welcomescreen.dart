import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
            child: Center(child: Text('Next'))));
  }
}
