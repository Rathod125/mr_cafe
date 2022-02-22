import 'package:flutter/material.dart';
import 'package:mr_cafe/widgets/tabs.dart';

class MenuTabBar extends StatelessWidget {
  MenuTabBar({Key? key}) : super(key: key);
  List<String> items = [
    'All',
    'Burning Beverages',
    'Hot Teas',
    'Lemonades',
    'Desserts',
    'Cafe Frappes',
    'Ice Teas',
    'Mocktails',
    'Freaky Frappes'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: items.length,
        child: Expanded(
          child: Column(children: [
            Container(
              height: 40,
              child: TabBar(
                physics: BouncingScrollPhysics(),
                unselectedLabelColor: Color(0XFF212325),
                labelColor: Colors.white,
                isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFD4A056)),
                tabs: [
                  Tabs(
                    menuitems: items[0],
                  ),
                  Tabs(
                    menuitems: items[1],
                  ),
                  Tabs(
                    menuitems: items[2],
                  ),
                  Tabs(
                    menuitems: items[3],
                  ),
                  Tabs(
                    menuitems: items[4],
                  ),
                  Tabs(
                    menuitems: items[5],
                  ),
                  Tabs(
                    menuitems: items[6],
                  ),
                  Tabs(
                    menuitems: items[7],
                  ),
                  Tabs(
                    menuitems: items[8],
                  ),
                ],
              ),
            ),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      children: [
                        Center(
                          child: Text(
                            items[0],
                            style: TextStyle(fontSize: 100),
                          ),
                        )
                      ],
                      physics: BouncingScrollPhysics(),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                    Center(
                      child: Text(items[0]),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
