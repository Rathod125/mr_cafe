import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Itemlist extends StatelessWidget {
  const Itemlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1284, 2778),
      builder: () {
        return SafeArea(
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              ItemCard(),
              ItemCard()
            ],
          ),
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (contex) {
                return Item(itemname: 'Espresso');
              }));
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF212325)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,

                // SkeletonAnimation method
                children: <Widget>[
                  Container(
                    width: 110.0,
                    height: 110.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/cofee.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 5.0),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Text(
                              'Espresso',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontFamily: 'Libre Baskerville'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              width: 60,
                              height: 13,
                              child: const Text(
                                '150/-',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                      child: Icon(
                    Icons.chevron_right,
                    color: Colors.white70,
                    size: 40,
                  ))
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: Colors.black45,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
