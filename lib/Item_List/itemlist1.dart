import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist1 extends StatelessWidget {
  Itemlist1({Key? key}) : super(key: key);

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
  List prices = ['150/-', '100/-', '150/-', '100/-', '150/-', '100/-'];

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
