import 'package:flutter/material.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    return Scaffold(
      backgroundColor: Color(0xFFEADBCC),
      body: Column(children: [
        Flexible(
          child: Container(
            height: MediaQuery.of(context).size.height * .35,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/Cafes-in-Indore.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212325)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter Your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Your password'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF212325),
                  minimumSize: const Size(200, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
