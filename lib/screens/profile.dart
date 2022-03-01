import 'package:flutter/material.dart';
import 'package:mr_cafe/constants.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

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
  IconThemeData iconTheme = IconThemeData(color: Color(0xFF212325));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Name SurName',
                style: TextStyle(fontSize: 20, fontFamily: 'Libre Baskerville'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: infoitems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    iconColor: Color(0xFF212325),
                    leading: icons[index],
                    title: Text(infoitems[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
