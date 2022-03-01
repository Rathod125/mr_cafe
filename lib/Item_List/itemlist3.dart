import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist2 extends StatelessWidget {
  Itemlist2({Key? key}) : super(key: key);

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
