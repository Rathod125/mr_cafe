import 'package:flutter/material.dart';

import '../screens/item.dart';
import '../widgets/itemlist.dart';

class Itemlist2 extends StatelessWidget {
  Itemlist2({Key? key, required this.title}) : super(key: key);
  final String title;
  List itemname = [
    'Affogoto',
    'Cold Brew',
    'Cold Brew Tonic',
    'Espresso Tonic',
    'Iced Espresso',
    'Vietnamese'
  ];
  List<String> images = [
    'assets/coldcoffee/affogoto.jpeg',
    'assets/coldcoffee/coldbrew.jpeg',
    'assets/coldcoffee/coldbrewtonic.jpeg',
    'assets/coldcoffee/espressotonic.jpeg',
    'assets/coldcoffee/icedespresso.jpeg',
    'assets/coldcoffee/vietnamese.jpeg',
  ];
  List prices = ['210', '180', '220', '220', '180', '200'];

  List desc = [
    'Italian dessert prepared by pouring a double ristratto over 2 scoops of vanilla icecream.',
    'Prepared by steeping coffee with cold water overnight. This coffee is less acidic & has 67% less coffee oils.',
    'It is little less intense than the Espresso tonic,we use Cold Brew instead of Espresso to prepare this drink.',
    'A refreshing fizzy drink prepared by pouring a shot of espresso over ice & tonic water. \n"A virtual treat"',
    'A shot of espresso is pulled directly over ice. This coffee is prepared in a way to highlight the bright notes of Espresso.',
    'This coffee is for the ones with a sweet tooth, generous amount of condensed milk is added to cold brew to make a sweet yet strong coffee.'
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
