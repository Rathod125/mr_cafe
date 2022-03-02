import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/item.dart';

import '../widgets/itemlist.dart';

class Itemlist1 extends StatelessWidget {
  Itemlist1({Key? key, required this.title}) : super(key: key);
  final String title;
  List itemname = [
    'Capuccino',
    'Espresso',
    'Flat White',
    'Latte',
    'Long/Short Black',
    'Mocha'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/hotcoffee/capuccino.jpeg'),
    AssetImage('assets/hotcoffee/espresso.jpeg'),
    AssetImage('assets/hotcoffee/flatwhite.jpeg'),
    AssetImage('assets/hotcoffee/latte.jpeg'),
    AssetImage('assets/hotcoffee/longblack.jpeg'),
    AssetImage('assets/hotcoffee/mocha.jpeg'),
  ];
  List prices = ['160', '140', '160', '160', '150', '180'];

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
            image: images[index],
            price: prices[index],
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Item(
                        itemname: itemname[index],
                        description: 'Helllo',
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
