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
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xFF212325),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/cofee.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Espresso \nCapuccino",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Libre Baskerville',
                    color: Color(0xFFEADBCC)),
              ),
              Text(
                'Dark Roast',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
