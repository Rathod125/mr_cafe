import 'package:flutter/material.dart';
import 'package:mr_cafe/widgets/itemlist.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  static const String id = 'catagories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Itemlist(),
    );
  }
}
