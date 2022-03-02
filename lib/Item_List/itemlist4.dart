import 'package:flutter/material.dart';

import '../screens/item.dart';
import '../widgets/itemlist.dart';

class Itemlist4 extends StatelessWidget {
  Itemlist4({Key? key, required this.title}) : super(key: key);
  final String title;
  List itemname = [
    'Frappe Caramel',
    'Frappe Espresso',
    'Frappe Hazelnut',
    'Frappe Mocha'
  ];
  List<ImageProvider> images = [
    AssetImage('assets/frappe/caramel.jpeg'),
    AssetImage('assets/frappe/espresso.jpeg'),
    AssetImage('assets/frappe/hazelnut.jpeg'),
    AssetImage('assets/frappe/mocha.jpeg'),
  ];
  List prices = ['200', '180', '200', '200'];

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
