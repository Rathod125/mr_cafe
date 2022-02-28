import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mr_cafe/screens/home_screen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';
import 'package:mr_cafe/screens/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation animation;
  late Animation<double> rotateAnimation;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );
    rotateAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    user = _auth.authStateChanges().listen((user) {
      if (user == null) {
        print('User is cureently sign out');
      } else {
        print('User is singin');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFFEADBCC),
      splash: const Image(
        image: AssetImage('assets/logo.png'),
        fit: BoxFit.fill,
      ),
      duration: 3000,
      splashIconSize: animation.value * 300,
      nextScreen: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen()
          : const MainHome(),
    );
  }
}
