import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist5 extends StatelessWidget {
  Itemlist5({Key? key}) : super(key: key);

  List itemname = [
    'Blended Strawberry Lemonade',
    'Classic Lemonade',
    'Dragonfruit Lemonade',
    'Kiwi Lemonade',
    'Strawberry Lemonade'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/lemonade/blendedstrawbery.jpeg'),
    AssetImage('assets/lemonade/classic.jpeg'),
    AssetImage('assets/lemonade/dragonfruit.jpeg'),
    AssetImage('assets/lemonade/kiwi.jpeg'),
    AssetImage('assets/lemonade/strawbery.jpeg'),
  ];
  List prices = ['150/-', '100/-', '150/-', '100/-', '150/-'];

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
