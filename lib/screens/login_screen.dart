import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/mainscreen.dart';
import 'package:mr_cafe/screens/registration_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADBCC),
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Color(0xFF212325),
        ),
        inAsyncCall: spinner,
        child: Column(children: [
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
                Image(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.height * .15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .001,
                ),
                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212325),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.017,
                ),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'xyz@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'password',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    password = value;
                  },
                  
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      spinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return MainHome();
                            }),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Don\'t have account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RegistrationPage.id);
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              decorationThickness: 1.5),
                        )),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
