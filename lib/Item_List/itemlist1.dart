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

  List desc = [
    'A drink that originated in Italy. It consists of double ristretto, warm milk & nicely textured microfoam which is 1-1.5cm thick.',
    'A concentrated shot of thick syrupy flavourful liquid prepared by passing pressuro ized water through coffee.',
    'It is commonly found in NZ & Australia, it is similar to latte but with less milk.',
    'It consists of double espresso, warm milk & microfoam which is thinner than that of cappuccino.',
    'It is commonly found in NZ & Australia. A long / short black is prepared by pouring o double ristretto over hot water.',
    'A drink prepared by pouring warm milk & microfoam over a shot of espresso with chocolate syrup.'
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
            image: images[index],
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
