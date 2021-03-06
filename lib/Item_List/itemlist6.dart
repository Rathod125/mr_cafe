import 'package:flutter/material.dart';

import '../screens/item.dart';
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
  List<String> images = [
    'assets/desserts/caramelbrownie.jpeg',
    'assets/desserts/walnutbrownie.jpeg',
    'assets/desserts/nutellacheesecake.jpeg',
    'assets/desserts/raspberrycheesecake.jpeg',
  ];
  List prices = [
    '90',
    '90',
    '260',
    '240',
  ];
  List desc = [
    'Caramel Brownie is a chocolate baked confection with caramel on it.',
    'Walnut Brownie is a chocolate baked confection with piece of walnut in it.',
    'Nutella Cheesecake is consists of cheese cream and cookie crust on bottom and nutella on top.',
    'Raspberry Cheesecake is consists of cheese cream and cookie crust on bottom and raspberry jelly on top.'
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
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return ItemCard(
            title: itemname[index],
            image: AssetImage(images[index]),
            price: prices[index],
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Item(
                        itemname: itemname[index],
                        description: desc[index],
                        price: prices[index],
                        imageProvider: images[index]);
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
