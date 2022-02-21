import 'package:flutter/material.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:flutter/scheduler.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

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
              const SizedBox(height: 20.0),
              const Text(
                'Star bucks',
                style: kItemLableTextStyle,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain flowering plants in the Coffea genus. ',
                style: kNormalTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                style: ElevatedButton.styleFrom(
                    primary: kBackGroundColor,
                    fixedSize: const Size(80.0, 80.0),
                    shadowColor: Colors.amber.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
