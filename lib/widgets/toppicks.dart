import 'package:flutter/material.dart';

class Toppickes extends StatelessWidget {
  const Toppickes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToppicksCard(
                image: AssetImage('assets/hotcoffee/latte.jpeg'),
                itemname: 'Latte',
                rate: '₹160'),
            ToppicksCard(
                image: AssetImage('assets/coldcoffee/coldbrew.jpeg'),
                itemname: 'Cold Brew',
                rate: '₹180'),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToppicksCard(
                image: AssetImage('assets/frappe/caramel.jpeg'),
                itemname: 'Caramel \nFrappe',
                rate: '₹200'),
            ToppicksCard(
                image: AssetImage('assets/desserts/raspberrycheesecake.jpeg'),
                itemname: 'Raspberry \nCheesecake',
                rate: '₹240'),
          ],
        ),
      ],
    );
  }
}

class ToppicksCard extends StatelessWidget {
  ToppicksCard({
    Key? key,
    required this.image,
    required this.itemname,
    required this.rate,
  }) : super(key: key);

  final ImageProvider image;
  final String itemname;
  final String rate;

  // List<ImageProvider> image = [
  //   AssetImage('assets/hotcoffee/espresso.jpeg'),
  //   AssetImage('assets/coldcoffee/coldbrew.jpeg'),
  //   AssetImage('assets/frappe/caramel.jpeg'),
  //   AssetImage('assets/desserts/raspberrycheesecake.jpeg')
  // ];

  // List itemname = [
  //   'Espresso',
  //   'Cold Brew',
  //   'Caramel \nFrappe',
  //   'Raspberry \nCheesecake'
  // ];

  // List rate = ['₹140', '180', '200', '240'];

  @override
  Widget build(BuildContext context) {
    // return
    // Container(
    //   height: MediaQuery.of(context).size.height * 0.5,
    //   width: MediaQuery.of(context).size.width * 0.475,
    // child:
    //  ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: image.length,
    //     itemBuilder: ((context, index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
          decoration: BoxDecoration(
              color: const Color(0xFF212325),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: image,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                itemname,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Libre Baskerville',
                    color: Color(0xFFEADBCC)),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rate,
                    style: TextStyle(fontSize: 22, color: Color(0xFFD4A056)),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                    // elevation: 6,
                    shape: const CircleBorder(),
                    fillColor: const Color(0xFFD4A056),
                    constraints: const BoxConstraints.tightFor(
                      width: 46.0,
                      height: 46.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
    // })),
    // );
  }
}
