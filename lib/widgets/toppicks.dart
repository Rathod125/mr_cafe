import 'package:flutter/material.dart';

class Toppickes extends StatelessWidget {
  const Toppickes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToppicksCard(),
            ToppicksCard(),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToppicksCard(),
            ToppicksCard(),
          ],
        ),
      ],
    );
  }
}

class ToppicksCard extends StatelessWidget {
  const ToppicksCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          decoration: BoxDecoration(
              color: Color(0xFF212325),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/cofee.jpg'),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Espresso \nCapuccino",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Libre Baskerville',
                    color: Color(0xFFEADBCC)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Dark Roast',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "\$68",
                    style: TextStyle(fontSize: 22, color: Color(0xFFD4A056)),
                  ),
                  
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
