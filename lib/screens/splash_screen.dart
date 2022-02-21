import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
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

    // colorAnimation =
    //     ColorTween(begin: Colors.white, end: Colors.cyanAccent).animate(
    //   CurvedAnimation(parent: animationController, curve: Curves.decelerate),
    // );
    // sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(animation);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFFEADBCC),
      splash: RotationTransition(
        turns: rotateAnimation,
        child: const Image(
          image: AssetImage('assets/logo.png'),

          // width: animation.value * 1000,
          fit: BoxFit.fill,
        ),
      ),
      duration: 3000,
      splashIconSize: animation.value * 500,
      animationDuration: Duration(seconds: 2),
      // splashTransition: SplashTransition.rotationTransition,
      nextScreen: const WelcomeScreen(),
    );
  }
}
