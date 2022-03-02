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
  List<ImageProvider> images = [
    AssetImage('assets/lemonade/blendedstrawbery.jpeg'),
    AssetImage('assets/lemonade/classic.jpeg'),
    AssetImage('assets/lemonade/dragonfruit.jpeg'),
    AssetImage('assets/lemonade/kiwi.jpeg'),
    AssetImage('assets/lemonade/strawbery.jpeg'),
  ];
  List prices = ['150', '100', '150', '100', '150'];

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
