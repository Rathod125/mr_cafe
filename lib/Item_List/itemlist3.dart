import 'package:flutter/material.dart';

import '../screens/item.dart';
import '../widgets/itemlist.dart';

class Itemlist3 extends StatelessWidget {
  Itemlist3({Key? key, required this.title}) : super(key: key);
  final String title;
  List itemname = [
    'Aero Press',
    'French Press',
    'V60 Pour-Over',
  ];
  List<ImageProvider> images = [
    AssetImage('assets/manualbrew/Aeropress.jpeg'),
    AssetImage('assets/manualbrew/Frenchpress.jpeg'),
    AssetImage('assets/manualbrew/V60pourover.jpeg'),
  ];
  List prices = ['150/-', '100/-', '150/-'];

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
