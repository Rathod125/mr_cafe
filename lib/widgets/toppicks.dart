import 'package:flutter/material.dart';

class Toppickes extends StatelessWidget {
  const Toppickes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF212325), borderRadius: BorderRadius.circular(20)),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/cofee.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
