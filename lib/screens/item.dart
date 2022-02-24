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
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/coldbrew.jpeg'),
                      radius: 150.0,
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
