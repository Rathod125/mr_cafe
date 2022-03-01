import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:flutter/scheduler.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Material(
      color: const Color(0xFF212325),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 150.0,
                backgroundImage: AssetImage('assets/cofee.jpg'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Star bucks',
                style: kItemLableTextStyle,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain flowering plants in the Coffea genus. ',
                style: kNormalTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: kBackGroundColor,
                      fixedSize: const Size(70, 70.0),
                      shadowColor: Colors.amber.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
