import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatelessWidget {
  Item({required this.itemname});
  String itemname;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(700, 700),
      builder: () {
        return Scaffold(
          backgroundColor: Color(0xFFEADBCC),
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFF212325)),
            backgroundColor: Color(0xFFEADBCC),
            title: Text(
              itemname,
              style: TextStyle(color: Color(0xFF212325)),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    radius: 153,
                    backgroundColor: Color(0xFF212325),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/coldbrew.jpeg'),
                      radius: 150.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Color(0xFF212325),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Espresso",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Libre Baskerville',
                            color: Color(0xFFEADBCC)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Dark Roast',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "150/-",
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFFD4A056)),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Libre Baskerville'),
                            ),
                            // elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: const Color(0xFFD4A056),
                            constraints: const BoxConstraints.tightFor(
                              width: 110.0,
                              height: 43.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
