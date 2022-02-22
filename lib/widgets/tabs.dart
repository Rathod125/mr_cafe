import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  Tabs({Key? key, required this.menuitems}) : super(key: key);
  String menuitems;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(menuitems),
    );
  }
}