import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/cart.dart';
import 'package:mr_cafe/screens/cart_provider.dart';
import 'package:mr_cafe/screens/db_helper.dart';
// import 'package:mr_cafe/screens/cart_scr, String descriptioneen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Item extends StatefulWidget {
  const Item(
      {Key? key,
      required this.itemname,
      required this.description,
      required this.price,
      required this.imageProvider})
      : super(key: key);
  final String itemname;
  final String description;
  final String price;
  final String imageProvider;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> with SingleTickerProviderStateMixin {
  int count = 0;
  int index = 0;
  DBHelper? dbHelper = DBHelper();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 25.0,
          splashColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFEADBCC),
          size: 35.0,
        ),
        backgroundColor: const Color(0xFFE212325),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05),
              child: Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(value.getCounter().toString());
                  },
                ),
                badgeColor: Color(0xFFD4A056),
                child:
                    // Icon(Icons.shopping_cart),
                    // position: BadgePosition(end: 20),
                    // child:
                  //   IconButton(
                  // onPressed: () {
                    // selectedIndex = cart.selectedIndex();

                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MainHome();
                    //     },
                    //   ),
                    // );
                  // },
                  InkWell(
                    onTap: (() {
                      selectedIndex = cart.selectedIndex();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainHome();
                        },
                      ),
                    );
                    }),
                    child: Icon(Icons.shopping_cart)),
                
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF212325),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackGroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * -0.15,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                color: Color(0xFF212325),
                                spreadRadius: 4)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(widget.imageProvider),
                          radius: MediaQuery.of(context).size.width * 0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .22,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .95,
                        padding:
                            const EdgeInsets.only(top: 15, left: 25, right: 25),
                        decoration: BoxDecoration(
                            color: const Color(0xFF212325),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7.0),
                            ),
                            Text(
                              widget.itemname,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.075,
                                  fontFamily: 'Libre Baskerville',
                                  color: Color(0xFFEADBCC)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    fontFamily: 'Libre Baskerville',
                                    color: Colors.grey),
                              ),
                            ),
                            Wrap(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 11),
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10.0),
                                  width:
                                      MediaQuery.of(context).size.width * .98,
                                  child: Text(
                                    widget.description,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .06,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${widget.price}/-',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.07,
                                      color: Color(0xFFD4A056)),
                                ),
                                InkWell(
                                  onTap: (() {
                                    print(widget.price);

                                    dbHelper!
                                        .insert(Cart(
                                            id: cart.getCounter(),
                                            productId:
                                                cart.getCounter().toString(),
                                            productName: widget.itemname,
                                            intialPrice:
                                                int.parse(widget.price),
                                            productPrice:
                                                int.parse(widget.price),
                                            quantity: 1,
                                            image: widget.imageProvider
                                                .toString()))
                                        .then((value) {
                                      print('Product is added to cart');
                                      cart.addTotalPrice(
                                          double.parse(widget.price));
                                      cart.addCounter();
                                      fToast.showToast(
                                        toastDuration:
                                            Duration(milliseconds: 1500),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color.fromARGB(255, 237, 231, 224),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(Icons.shopping_bag),
                                                Text(
                                                  "Item is added into cart",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        gravity: ToastGravity.BOTTOM,
                                      );
                                    }).onError((error, stackTrace) {
                                      print(error.toString());
                                      fToast.showToast(
                                        toastDuration:
                                            Duration(milliseconds: 1500),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color.fromARGB(255, 237, 231, 224),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(Icons.error_outline),
                                                Text(
                                                  "Item is already in Cart",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        gravity: ToastGravity.BOTTOM,
                                      );
                                    });
                                  }),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFD4A056),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          fontFamily: 'Libre Baskerville',
                                        ),
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     IconButton(
                                    //       onPressed: () {
                                    //         setState(() {
                                    //           if (count > 0) {
                                    //             count--;
                                    //           }
                                    //         });
                                    //       },
                                    //       icon: Icon(Icons.remove),
                                    //     ),
                                    //     Text(
                                    //       count.toString(),
                                    //       style: TextStyle(fontSize: 18.0),
                                    //     ),
                                    //     IconButton(
                                    //       onPressed: () {
                                    //         setState(() {
                                    //           if (count < 10) {
                                    //             count++;
                                    //           }
                                    //         });
                                    //       },
                                    //       icon: Icon(Icons.add),
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
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
        ),
      ),
    );
  }
}
