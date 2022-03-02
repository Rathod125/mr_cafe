import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cartviewlist.length,
        itemBuilder: (context, index) {
          return cartviewlist[index];
        },
      ),
    );
  }
}
