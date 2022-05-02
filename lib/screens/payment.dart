import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/cart_provider.dart';
import 'package:mr_cafe/screens/cart_screen.dart';
import 'package:mr_cafe/screens/mainscreen.dart';
import 'package:mr_cafe/screens/map.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class Payment extends StatelessWidget {
  Payment({Key? key}) : super(key: key);
  static const String id = 'payment';
  bool takeaway = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFEADBCC),
          iconTheme: const IconThemeData(color: Color(0xFF212325)),
          title: const Text(
            'CafeApp',
            style: TextStyle(color: Color(0xFF212325)),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<CartProvider>(
                  builder: ((context, value, child) {
                    return Visibility(
                      visible:
                          value.getTotalPrice().toStringAsFixed(2) == '0.00'
                              ? false
                              : true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 232, 179, 105),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReusableWidget(
                                title: Text('Sub Total',
                                    style: TextStyle(
                                        fontFamily: 'Libre Baskerville',
                                        fontSize: 15)),
                                value:
                                    value.getTotalPrice().toStringAsFixed(2) +
                                        '/-'),
                            ReusableWidget(
                                title: Text('Discount 5%',
                                    style: TextStyle(
                                        fontFamily: 'Libre Baskerville',
                                        fontSize: 15)),
                                value: '-' +
                                    (value.getTotalPrice() * 0.05)
                                        .toStringAsFixed(2) +
                                    '/-'),
                            ReusableWidget(
                                title: Text('Total Amount',
                                    style: TextStyle(
                                        fontFamily: 'Libre Baskerville',
                                        fontSize: 15)),
                                value: (value.getTotalPrice() -
                                            value.getTotalPrice() * 0.05)
                                        .toStringAsFixed(2) +
                                    '/-'),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF212325)),
                                    onPressed: (() {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: ((context) {
                                        return MapSample();
                                      })));
                                    }),
                                    child: Text('Select Address To Deliver',
                                        style: TextStyle(
                                            fontFamily: 'Libre Baskerville',
                                            fontSize: 12)),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF212325)),
                                    onPressed: (() {
                                      takeaway = true;
                                    }),
                                    child: Text('Take Away',
                                        style: TextStyle(
                                            fontFamily: 'Libre Baskerville',
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: takeaway ? true : false,
                              child: Column(
                                children: [
                                  GooglePayButton(
                                    paymentConfigurationAsset: 'gpay.json',
                                    paymentItems: paymentItem,
                                    width: 200,
                                    height: 50,
                                    style: GooglePayButtonStyle.white,
                                    type: GooglePayButtonType.pay,
                                    margin: const EdgeInsets.only(top: 15.0),
                                    onPaymentResult: (data) {
                                      print(data);
                                    },
                                    loadingIndicator: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFF212325)),
                                        onPressed: (() {
                                          Dialog dialog = Dialog(
                                            backgroundColor:Color(0xFF212325) ,
                                            shape: RoundedRectangleBorder(                                         
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)), //this right here
                                            child: Container(
                                              // decoration: BoxDecoration(
                                              //   borderRadius: BorderRadius.circular(12)
                                              // ),
                                              // color:Color.fromARGB(255, 232, 179, 105),
                                              height: MediaQuery.of(context).size.height*0.3,
                                              width: 300.0,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Text(
                                                      'Thank You!',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                          color: Color(0xFFEADBCC)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Text(
                                                      'Your order will ready in few minutus.',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 18,
                                                      
                                                          color: Color(0xFFEADBCC)),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 50.0)),
                                                  TextButton(
                                                      onPressed: () {
                                                        selectedIndex = 0;
                                                        Navigator.of(context)
                                                            .pushReplacementNamed(
                                                                MainHome.id);
                                                      },
                                                      child: Text(
                                                        'Got It!',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(255, 232, 179, 105),
                                                            fontSize: 18.0),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          );
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  dialog);
                                        }),
                                        child: Text('Cash on Delivery',
                                            style: TextStyle(
                                                fontFamily: 'Libre Baskerville',
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ]),
        ),
      ),
    );
  }
}
