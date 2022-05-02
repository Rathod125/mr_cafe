import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/cart.dart';
import 'package:mr_cafe/screens/cart_provider.dart';
import 'package:mr_cafe/screens/db_helper.dart';
import 'package:mr_cafe/screens/item.dart';
import 'package:mr_cafe/screens/payment.dart';
import 'package:provider/provider.dart';
import 'package:pay/pay.dart';
final paymentItem = <PaymentItem>[];

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        body: Column(
      children: [
        FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Center(
                          child: Text(
                            'Your Cart is Empty!',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                            image: AssetImage(snapshot
                                                .data![index].image
                                                .toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, bottom: 10),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          bottom: 5.0),
                                                  child: SizedBox(
                                                    // height: 25,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Text(
                                                      snapshot.data![index]
                                                          .productName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white70,
                                                          fontFamily:
                                                              'Libre Baskerville'),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      dbHelper!.delete(snapshot
                                                          .data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .productPrice
                                                              .toString()));
                                                    },
                                                    child: Icon(
                                                      Icons.delete_forever,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.032,
                                                      color: Color.fromARGB(
                                                          255, 111, 99, 81),
                                                    )),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: SizedBox(
                                                  child: Text(
                                                    'Total Price : ${snapshot.data![index].productPrice}/-',
                                                    style: const TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  width: snapshot.data![index]
                                                              .quantity! >=
                                                          10
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.33
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0xFFD4A056),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          int quantity =
                                                              snapshot
                                                                  .data![index]
                                                                  .quantity!;
                                                          int price = snapshot
                                                              .data![index]
                                                              .intialPrice!;
                                                          quantity--;
                                                          int newPrice =
                                                              price * quantity;
                                                          if (quantity > 0) {
                                                            dbHelper!
                                                                .updateQuantity(Cart(
                                                                    id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!,
                                                                    productId: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!
                                                                        .toString(),
                                                                    productName: snapshot
                                                                        .data![
                                                                            index]
                                                                        .productName,
                                                                    intialPrice: snapshot
                                                                        .data![
                                                                            index]
                                                                        .intialPrice!,
                                                                    productPrice:
                                                                        newPrice,
                                                                    quantity:
                                                                        quantity,
                                                                    image: snapshot
                                                                        .data![
                                                                            index]
                                                                        .image
                                                                        .toString()))
                                                                .then((value) {
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              cart.removeTotalPrice(
                                                                  double.parse(snapshot
                                                                      .data![
                                                                          index]
                                                                      .intialPrice!
                                                                      .toString()));
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              print(error
                                                                  .toString());
                                                            });
                                                          }
                                                        },
                                                        icon:
                                                            Icon(Icons.remove),
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .quantity
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.018),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          int quantity =
                                                              snapshot
                                                                  .data![index]
                                                                  .quantity!;
                                                          int price = snapshot
                                                              .data![index]
                                                              .intialPrice!;
                                                          quantity++;
                                                          int newPrice =
                                                              price * quantity;

                                                          dbHelper!
                                                              .updateQuantity(Cart(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!,
                                                                  productId: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                                  productName: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productName,
                                                                  intialPrice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .intialPrice!,
                                                                  productPrice:
                                                                      newPrice,
                                                                  quantity:
                                                                      quantity,
                                                                  image: snapshot
                                                                      .data![
                                                                          index]
                                                                      .image
                                                                      .toString()))
                                                              .then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            cart.addTotalPrice(
                                                                double.parse(snapshot
                                                                    .data![
                                                                        index]
                                                                    .intialPrice!
                                                                    .toString()));
                                                          }).onError((error,
                                                                  stackTrace) {
                                                            print(error
                                                                .toString());
                                                          });
                                                        },
                                                        icon: Icon(Icons.add),
                                                      ),
                                                    ],
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
                            );
                          }));
                }
              } else {
                return Text('');
              }
            }),
        Consumer<CartProvider>(builder: ((context, value, child) {
          return Visibility(
            visible: value.getTotalPrice().toStringAsFixed(2) == '0.00'
                ? false
                : true,
            child: Container(
              color: Color(0xFFD4C7B7),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ReusableWidget(
                      title: Text('Sub Total',style: TextStyle(fontFamily: 'Libre Baskerville', fontSize: 15)),
                      value: value.getTotalPrice().toStringAsFixed(2) + '/-'),
                  ReusableWidget(
                      title: Text('Discount 5%',style: TextStyle(fontFamily: 'Libre Baskerville', fontSize: 15)),
                      value: '-' +
                          (value.getTotalPrice() * 0.05).toStringAsFixed(2) +
                          '/-'),
                  ReusableWidget(
                      title: Text('Total Amount',style: TextStyle(fontFamily: 'Libre Baskerville', fontSize: 15)),
                      value:
                          (value.getTotalPrice() - value.getTotalPrice() * 0.05)
                                  .toStringAsFixed(2) +
                              '/-'),

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: (() {
                        paymentItem.add(PaymentItem(
                      amount: cart.getTotalPrice().toString(),
                      label: 'Final Payment',
                      status: PaymentItemStatus.final_price));
                        Navigator.pushNamed(context, Payment.id);
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFD4A056),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, top: 15, right: 25, bottom: 15),
                          child: Text(
                            'Proceed To Pay',
                            style: TextStyle(
                                fontSize: 17, fontFamily: 'Libre Baskerville'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // GooglePayButton(
                  //   paymentConfigurationAsset: 'gpay.json',
                  //   paymentItems: paymentItem,
                  //   width: 200,
                  //   height: 50,
                  //   style: GooglePayButtonStyle.black,
                  //   type: GooglePayButtonType.pay,
                  //   margin: const EdgeInsets.only(top: 15.0),
                  //   onPaymentResult: (data) {
                  //     print(data);
                  //   },
                  //   loadingIndicator: const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }))
      ],
    ));
  }
}

class ReusableWidget extends StatelessWidget {
  final String value;
  final Text title;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        Text(
          value.toString(),
          style: TextStyle(fontFamily: 'Libre Baskerville', fontSize: 15),
        ),
      ],
    );
  }
}
