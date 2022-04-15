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
  List<String> images = const [
    'assets/manualbrew/Aeropress.jpeg',
    'assets/manualbrew/Frenchpress.jpeg',
    'assets/manualbrew/V60pourover.jpeg',
  ];
  List prices = ['180', '180', '180'];

  List desc = [
    'Comparitively a new kid on the black. It is made of high quality plastic which makes it ideal to use during traveling. It is capable to make coffees as intense as Espresso and light as pourovers. We at Meraki aim for medium body and a very clean finish.',
    'An age old classic method dated back to 1929 which is used to make strong black o coffee. We at Meraki have modified it in a way to highlight the delicate flavours of the single origins with a very smooth body.',
    'Pour-over involves pouring hot water over a bed of coffee kept in a cone containing a paper filter. The water seeps through the coffee due to gravity. Watching a V60 prepared is almost therapeutic, it tends to be light bodied & flavourful.'
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
