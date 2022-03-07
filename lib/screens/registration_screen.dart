import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/home_screen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';

import '../constants.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const id = 'registration_scrren';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                "Registration",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212325)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'xyz@gmail.com',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  } else if (value.length < 6) {
                    return "At least 6 charechter";
                  } else if (value.length > 15) {
                    return "Not more than 15 charecter";
                  }
                },
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.pushReplacementNamed(context, MainHome.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF212325),
                  minimumSize: const Size(200, 50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
