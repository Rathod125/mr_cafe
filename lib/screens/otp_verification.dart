import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';

class OTPVERIFICATION extends StatefulWidget {
  OTPVERIFICATION({Key? key, required this.phoneNumber}) : super(key: key);

  final PhoneNumber phoneNumber;

  @override
  State<OTPVERIFICATION> createState() => _OTPVERIFICATIONState();
}

class _OTPVERIFICATIONState extends State<OTPVERIFICATION> {
  String sms = '';
  late String verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController smsController = TextEditingController();

  Future<void> phoneVerification(String phonenumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (PhoneAuthCredential phoneauthcredential) async {
        User user = FirebaseAuth.instance.currentUser!;
        if (phoneauthcredential.smsCode != null) {
          try {
            UserCredential userCredential =
                await user.linkWithCredential(phoneauthcredential);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'provider-already-linked') {
              await _auth.signInWithCredential(phoneauthcredential);
            }
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainHome(),
            ),
          );
        }
      },
      verificationFailed: (FirebaseAuthException expection) {
        Alert(text: expection.code);
      },
      codeSent: (String verificationId, int? resendingToken) async {
        this.verificationId = verificationId;
        print('code sent');
      },
      codeAutoRetrievalTimeout: (String timeout) {
        return;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneVerification(widget.phoneNumber.completeNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VERIFICATION',
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: smsController,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter OTP',
                ),
                onChanged: (value) {
                  sms = value;
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            TextButton(
              onPressed: () async {
                try {
                  final AuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: sms);
                  final user = (await FirebaseAuth.instance
                          .signInWithCredential(credential))
                      .user;
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainHome(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  Alert(text: e.code);
                }
              },
              child: const Text(
                'verify',
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
      ),
    );
  }
}
