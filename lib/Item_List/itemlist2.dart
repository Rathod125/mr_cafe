import 'package:flutter/material.dart';

import '../widgets/itemlist.dart';

class Itemlist2 extends StatelessWidget {
  Itemlist2({Key? key}) : super(key: key);

  List itemname = [
    'Affogoto',
    'Cold Brew',
    'Cold Brew Tonic',
    'Espresso Tonic',
    'Iced Espresso',
    'Vietnamese'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/coldcoffee/affogoto.jpeg'),
    AssetImage('assets/coldcoffee/coldbrew.jpeg'),
    AssetImage('assets/coldcoffee/coldbrewtonic.jpeg'),
    AssetImage('assets/coldcoffee/espressotonic.jpeg'),
    AssetImage('assets/coldcoffee/icedespresso.jpeg'),
    AssetImage('assets/coldcoffee/vietnamese.jpeg'),
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
