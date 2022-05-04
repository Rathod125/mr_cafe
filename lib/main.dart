import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/cart_provider.dart';
import 'package:mr_cafe/screens/home_screen.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';
import 'package:mr_cafe/screens/payment.dart';
import 'package:mr_cafe/screens/registration_screen.dart';
import 'package:mr_cafe/screens/splash_screen.dart';
import 'package:mr_cafe/screens/welcomescreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xFF212325),
                scaffoldBackgroundColor: kBackGroundColor,
                appBarTheme: AppBarTheme(elevation: 0.5),
              ),
              initialRoute: SplashScreen.id,
              routes: {
                WelcomeScreen.id: (context) => WelcomeScreen(),
                SplashScreen.id: (context) => const SplashScreen(),
                HomePage.id: (context) => const HomePage(),
                LoginPage.id: (context) => const LoginPage(),
                RegistrationPage.id: (context) => RegistrationPage(),
                MainHome.id: (context) => const MainHome(),
                Payment.id: (context) => Payment(),
              });
        }));
  }
}
