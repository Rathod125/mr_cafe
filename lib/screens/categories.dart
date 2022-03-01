import 'package:flutter/material.dart';
import 'package:mr_cafe/Item_List/itemlist1.dart';
import 'package:mr_cafe/Item_List/itemlist2.dart';
import 'package:mr_cafe/widgets/itemlist.dart';

import '../Item_List/itemlist3.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADBCC),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF212325)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFF212325)),
        ),
        backgroundColor: const Color(0xFFEADBCC),
      ),
      body: Itemlist3(),
    );
  }
}
