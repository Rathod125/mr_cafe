import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({required this.itemname});
  String itemname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEADBCC),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF212325)),
        backgroundColor: Color(0xFFEADBCC),
        title: Text(
          itemname,
          style: TextStyle(color: Color(0xFF212325)),
        ),
      ),
    );
  }
}
