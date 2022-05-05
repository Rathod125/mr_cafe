import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mr_cafe/screens/cart_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _fireStore = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // late User loggedInUser;
  // TextEditingController textEditingController = TextEditingController();
  // TextEditingController controller = TextEditingController();
  late String userName;
  late String number;
  late String emal;

  List infoitems = [
    'My Orders',
    'My Profile',
    'Payment Method',
    'Contact Us',
    'Settings'
  ];

  List<Icon> icons = [
    Icon(Icons.list),
    Icon(Icons.person),
    Icon(Icons.payment),
    Icon(Icons.contact_page),
    Icon(Icons.settings),
  ];

  // Future<void> getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  IconThemeData iconTheme = IconThemeData(color: Color(0xFF212325));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Color(0xFF212325),
                radius: MediaQuery.of(context).size.width * .22,
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.width * .4,
                  color: Color(0xFFEADBCC),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('user').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
                final userData = snapshot.data?.docs;

                for (var data in userData!) {
                  final username = data.get('name');
                  final phonenumber = data.get('Mobile number');
                  final email = data.get('email');
                  userName = username;
                  number = phonenumber;
                  emal = email;
                }
                return Column(
                  children: [
                    //             Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: Text(
                    //     userName,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(fontSize: 20, fontFamily: 'Libre Baskerville'),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(),
                    //   child: Text(
                    //     number,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(fontSize: 20, fontFamily: 'Libre Baskerville'),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Text(
                            userName,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Mobile Number:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Text(
                            number,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Email:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 5),
                          child: Text(
                            emal,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 16),
            //   child: Container(
            //     child: Text(
            //       'SurName',
            //       textAlign: TextAlign.start,
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   iconColor: Color(0xFF212325),
            //   title: TextFormField(
            //     onChanged: (value) {
            //       controller.text = value;
            //       // setState(() {
            //       //   lastname = value;
            //       // });
            //     },
            //     onEditingComplete: () {},
            //     decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.symmetric(
            //           vertical: 15.0, horizontal: 20.0),
            //       focusColor: Color.fromARGB(255, 81, 85, 90),
            //       filled: true,
            //       fillColor: Color(0xFFDACABD),
            //       hintText: 'Enter Your SurName',
            //       hintStyle: TextStyle(
            //           // height: 2.7,
            //           color: const Color.fromARGB(255, 81, 85, 90),
            //           fontSize: MediaQuery.of(context).size.height * 0.02),
            //       border: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //         borderSide: BorderSide.none,
            //       ),
            //     ),
            //   ),
            // ),
            // Consumer<CartProvider>(builder: ((context, value, child) {
            //   child:
            // Padding(
            //   padding: const EdgeInsets.only(left: 16),
            //   child: Container(
            //     child: Text(
            //       'FirstName',
            //       textAlign: TextAlign.start,
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ),
            // ),
            // ListTile(
            //   iconColor: Color(0xFF212325),
            //   title: TextFormField(
            //     onChanged: (value) {
            //       textEditingController.text = value;
            //       // setState(() {
            //       //   name = value;
            //       // });
            //     },
            //     decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.symmetric(
            //           vertical: 15.0, horizontal: 20.0),
            //       focusColor: Color.fromARGB(255, 81, 85, 90),
            //       filled: true,
            //       fillColor: Color(0xFFDACABD),
            //       hintText: 'Enter Your Name',
            //       hintStyle: TextStyle(
            //           // height: 2.7,
            //           color: const Color.fromARGB(255, 81, 85, 90),
            //           fontSize: MediaQuery.of(context).size.height * 0.02),
            //       border: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //         borderSide: BorderSide.none,
            //       ),
            //     ),
            //   ),
            // );
            // }
            // )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            ListTile(
              iconColor: Color(0xFF212325),
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              tileColor: Color.fromARGB(255, 220, 201, 182),
            )
          ],
        ),
      ),
    );
  }
}
