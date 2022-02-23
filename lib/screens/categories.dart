import 'package:flutter/material.dart';
import 'package:mr_cafe/widgets/itemlist.dart';

class Categories extends StatelessWidget {
  Categories({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEADBCC),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF212325)),
        title: Text(
          title,
          style: TextStyle(color: Color(0xFF212325)),
        ),
        backgroundColor: Color(0xFFEADBCC),
      ),
      body: Itemlist(),
    );
  }
}
