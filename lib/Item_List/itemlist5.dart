import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist5 extends StatelessWidget {
  Itemlist5({Key? key}) : super(key: key);

  List itemname = [
    'Frappe Caramel',
    'Frappe Espresso',
    'Frappe Hazelnut',
    'Frappe Mocha'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/frappe/caramel.jpeg'),
    AssetImage('assets/frappe/espresso.jpeg'),
    AssetImage('assets/frappe/hazelnut.jpeg'),
    AssetImage('assets/frappe/mocha.jpeg'),
  ];
  List prices = ['150/-', '100/-', '150/-', '100'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: itemname.length,
        itemBuilder: ((context, index) {
          return ItemCard(
            title: itemname[index],
            image: images[index],
            price: prices[index],
          );
        }),
      ),
    );
  }
}
