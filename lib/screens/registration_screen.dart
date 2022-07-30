import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mr_cafe/screens/login_screen.dart';

import 'package:mr_cafe/screens/otp_verification.dart';

import '../constants.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const id = 'registration_scrren';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  late String number;
  late PhoneNumber phoneNumber;
  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADBCC),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : SingleChildScrollView(
                child: Column(children: [
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        TextFormField(
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter Name'),
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        IntlPhoneField(
                          controller: phone_controller,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter phone number'),
                          initialCountryCode: 'IN',
                          showDropdownIcon: false,
                          flagsButtonPadding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          onChanged: (value) {
                            phoneNumber = value;
                            setState(() {
                              number = phoneNumber.completeNumber;
                            });
                            // print(number);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
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
                            // Navigator.pop(context);
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final newuser = await _auth
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password)
                                  .then((signedInUser) {})
                                  .catchError((e) {
                                // print(e);
                              });
                              textEditingController.clear();
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .add({
                                'name': name,
                                'Mobile number': number,
                                'email': email,
                              });
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OTPVERIFICATION(
                                      phoneNumber: phoneNumber,
                                    ),
                                  ));
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Alert(text: e.code),
                                ),
                              );
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
