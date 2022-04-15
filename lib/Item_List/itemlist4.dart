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
  List<String> images = [
    'assets/frappe/caramel.jpeg',
    'assets/frappe/espresso.jpeg',
    'assets/frappe/hazelnut.jpeg',
    'assets/frappe/mocha.jpeg',
  ];
  List prices = ['200', '180', '200', '200'];

  List desc = [
    'Caramel Frappe is made with rich caramel flavor and a hint of coffee, blended with ice and topped with whipped topping and caramel drizzle.',
    'Espresso Frappe is made with rich chocolate flavor and a hint of coffee, blended with ice.',
    'Hazelnut Frappe is made with rich hazelnut flavor and a hint of coffee, blended with ice and topped with whipped cream.',
    'Mocha Frappe is made with rich coffee flavor and blended with ice and topped with whipped topping and chocolate drizzle.'
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
