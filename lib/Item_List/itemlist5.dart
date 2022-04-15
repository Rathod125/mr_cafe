import 'package:flutter/material.dart';

import '../screens/item.dart';
import '../widgets/itemlist.dart';

class Itemlist5 extends StatelessWidget {
  Itemlist5({Key? key, required this.title}) : super(key: key);
  final String title;
  List itemname = [
    'Blended Strawberry Lemonade',
    'Classic Lemonade',
    'Dragonfruit Lemonade',
    'Kiwi Lemonade',
    'Strawberry Lemonade'
  ];
  List<String> images = [
    'assets/lemonade/blendedstrawbery.jpeg',
    'assets/lemonade/classic.jpeg',
    'assets/lemonade/dragonfruit.jpeg',
    'assets/lemonade/kiwi.jpeg',
    'assets/lemonade/strawbery.jpeg',
  ];
  List prices = ['250', '180', '200', '220', '220'];

  List desc = [
    'blended Strawberry Lemonade is a sweetened lemon-flavored beverage with puree of strawberry.',
    'Lemonade is a sweetened lemon-flavored beverage.',
    'Dragonfruit Lemonade is a sweetened lemon-flavored beverage with pieces of Dragonfruit.',
    'Kiwi Lemonade is a sweetened lemon-flavored beverage with pieces of Kiwi.',
    'Strawberry Lemonade is a sweetened lemon-flavored beverage with pieces of Strawberry.'
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
