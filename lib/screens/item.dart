import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_cafe/constants.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.itemname}) : super(key: key);
  final String itemname;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(700, 700),
      builder: () {
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
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
          ),
          // body: SingleChildScrollView(
          //   physics: const BouncingScrollPhysics(),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 20.0),
          //           child: Container(
          //             decoration: const BoxDecoration(
          //               color: Colors.white,
          //               shape: BoxShape.circle,
          //               boxShadow: [
          //                 BoxShadow(
          //                     blurRadius: 15,
          //                     color: Color.fromARGB(255, 102, 90, 78),
          //                     spreadRadius: 4)
          //               ],
          //             ),
          //             // child: const CircleAvatar(
          //             //   radius: 153,
          //             //   backgroundColor: Color.fromARGB(255, 102, 90, 78),
          //             child: CircleAvatar(
          //               backgroundImage:
          //                   const AssetImage('assets/coldbrew.jpeg'),
          //               radius: MediaQuery.of(context).size.width * 0.32,
          //             ),
          //           ),
          //         ),
          //       ),
          //       // ),
          //       Padding(
          //         padding: const EdgeInsets.all(15.0),
          //   child: Container(
          //     padding:
          //         const EdgeInsets.only(top: 15, left: 25, right: 25),
          //     decoration: BoxDecoration(
          //         color: const Color(0xFF212325),
          //         borderRadius: BorderRadius.circular(30)),
          //     child: Column(
          //       // mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 15),
          //         ),
          //         const SizedBox(
          //           height: 15,
          //         ),
          //         const Text(
          //           "Espresso",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 30,
          //               fontFamily: 'Libre Baskerville',
          //               color: Color(0xFFEADBCC)),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         const Text(
          //           'Dark Roast',
          //           textAlign: TextAlign.left,
          //           style: TextStyle(color: Colors.grey),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             const Text(
          //               "150/-",
          //               style: TextStyle(
          //                   fontSize: 22, color: Color(0xFFD4A056)),
          //             ),
          //             RawMaterialButton(
          //               padding: EdgeInsets.symmetric(horizontal: 10),
          //               onPressed: () {},
          //               child: const Text(
          //                 'Add to cart',
          //                 maxLines: 1,
          //                 style: TextStyle(
          //                     fontSize: 15,
          //                     fontFamily: 'Libre Baskerville'),
          //               ),
          //               // elevation: 6,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(10)),
          //               fillColor: const Color(0xFFD4A056),
          //               // constraints: const BoxConstraints.tightFor(
          //               //   width: 110.0,
          //               //   height: 43.0,
          //               // ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //       const Padding(
          //         padding: EdgeInsets.fromLTRB(20, 8, 0, 6),
          //         child: Align(
          //           alignment: Alignment.centerLeft,
          //           child: Text(
          //             'Description',
          //             style: TextStyle(
          //                 fontSize: 22,
          //                 fontFamily: 'Libre Baskerville',
          //                 color: Color(0xFF212325)),
          //           ),
          //         ),
          //       ),

          //       Padding(
          //         padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          //         child: Wrap(
          //           children: const [
          //             Text(
          //               'A concentrated shot of thick syrupy flavourful liquid prepared by passing pressurized water through coffee.',
          //               textAlign: TextAlign.left,
          //               style:
          //                   TextStyle(fontSize: 17, color: Color(0xFF212325)),
          //             )
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFF212325),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    // width: double.infinity,
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
                          top: -120.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 15,
                                    // color: Color.fromARGB(255, 102, 90, 78),
                                    color: Color(0xFF212325),
                                    spreadRadius: 4)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                'assets/coldbrew.jpeg',
                              ),
                              radius: MediaQuery.of(context).size.width * 0.32,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .95,
                            padding: const EdgeInsets.only(
                                top: 15, left: 25, right: 25),
                            decoration: BoxDecoration(
                                color: const Color(0xFF212325),
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7.0),
                                ),
                                //  SizedBox(
                                //   height: 15,
                                // ),
                                const Text(
                                  "Espresso",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'Libre Baskerville',
                                      color: Color(0xFFEADBCC)),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                const Text(
                                  'Dark Roast',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'Libre Baskerville',
                                        color: Colors.grey),
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      // padding: const EdgeInsets.symmetric(
                                      //     horizontal: 10.0),
                                      width: MediaQuery.of(context).size.width *
                                          .98,
                                      child: Text(
                                        'A concentrated shot of thick syrupy flavourful liquid prepared by passing pressurized water through coffee.',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "150/-",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xFFD4A056)),
                                    ),
                                    RawMaterialButton(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      onPressed: () {},
                                      child: const Text(
                                        'Add to cart',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Libre Baskerville'),
                                      ),
                                      // elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      fillColor: const Color(0xFFD4A056),
                                      // constraints: const BoxConstraints.tightFor(
                                      //   width: 110.0,
                                      //   height: 43.0,
                                      // ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
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
      },
    );
  }
}
// child: CircleAvatar(
//                   backgroundImage: const AssetImage('assets/coldbrew.jpeg'),
//                   radius: MediaQuery.of(context).size.width * 0.32,
//                 ),