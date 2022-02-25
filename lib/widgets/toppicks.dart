import 'package:flutter/material.dart';

class Toppickes extends StatelessWidget {
  const Toppickes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ToppicksCard(),
            ToppicksCard(),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
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
          padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
          decoration: BoxDecoration(
              color: const Color(0xFF212325),
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
                height: 15,
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "\$68",
                    style: TextStyle(fontSize: 22, color: Color(0xFFD4A056)),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                    // elevation: 6,
                    shape: const CircleBorder(),
                    fillColor: const Color(0xFFD4A056),
                    constraints: const BoxConstraints.tightFor(
                      width: 46.0,
                      height: 46.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
