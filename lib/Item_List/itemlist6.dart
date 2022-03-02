import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist6 extends StatelessWidget {
  Itemlist6({Key? key, required this.title}) : super(key: key);

  final String title;
  List itemname = [
    'Caramel Brownie',
    'Walnut Brownie',
    'Nutella Cheesecake',
    'Raspberry Cheesecake'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/desserts/caramelbrownie.jpeg'),
    AssetImage('assets/desserts/walnutbrownie.jpeg'),
    AssetImage('assets/desserts/nutellacheesecake.jpeg'),
    AssetImage('assets/desserts/raspberrycheesecake.jpeg'),
  ];
  List prices = [
    '150/-',
    '100/-',
    '150/-',
    '100/-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF212325)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFF212325)),
        ),
        backgroundColor: const Color(0xFFEADBCC),
      ),
      body: ListView.builder(
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
