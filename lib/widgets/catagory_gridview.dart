import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: const [
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: const [
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: const [
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: 42,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFEADBCC),
                  radius: 40,
                  child: Image(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
              Text(
                "capaccino",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
