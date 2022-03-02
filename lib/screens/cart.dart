import 'package:flutter/material.dart';

class CartVeiw extends StatelessWidget {
  CartVeiw(
      {Key? key,
      required this.imageProvider,
      required this.title,
      required this.price,
      required this.count})
      : super(key: key);
  final ImageProvider imageProvider;
  final String title;
  final String price;
  final int count;
  int amount = 0;
  void calculatePrice() {
    amount = int.parse(price) * count;
  }

  @override
  Widget build(BuildContext context) {
    calculatePrice();
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFF212325)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,

              // SkeletonAnimation method
              children: <Widget>[
                SizedBox(
                  width: 110.0,
                  height: 110.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 5.0),
                          child: SizedBox(
                            // height: 25,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontFamily: 'Libre Baskerville'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: SizedBox(
                              // width: 60,
                              // height: 13,
                              child: Text(
                                amount.toString(),
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
