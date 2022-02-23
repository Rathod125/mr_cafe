import 'package:flutter/material.dart';

class Itemlist extends StatelessWidget {
  const Itemlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [ItemCard(), ItemCard()],
      ),
    );

    //  Column(
    //   children: [
    //     Container(
    //       decoration: const BoxDecoration(color: Colors.red),
    //       height: 300,
    //       child: const ListTile(
    //         leading: CircleAvatar(
    //           backgroundImage: AssetImage('assets/logo.png'),
    //           radius: 30,
    //           backgroundColor: Colors.white,
    //         ),
    //         title: Text('Espresso'),
    //         subtitle: Text('coffee'),
    //         trailing: Text('95/-'),
    //       ),
    //     ),
    //     Container(
    //       height: 100,
    //       child: const ListTile(
    //         tileColor: Colors.brown,
    //         leading: Image(
    //           image: AssetImage('assets/cofee.jpg'),
    //           height: 100,
    //           width: 100,
    //         ),
    //         title: Text('Espresso'),
    //         trailing: Text('95/-'),
    //       ),
    //     )
    //   ],
    // );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
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
              width: 100.0,
              height: 100.0,
              child: Image.asset(
                'assets/cofee.jpg',
                fit: BoxFit.fill,
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
                    padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                    child: Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        'Espresso',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
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
                        child: Text(
                          '150/-',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Icon(
              Icons.chevron_right,
              color: Colors.white70,
              size: 40,
            ))
          ],
        ),
      ),
    );
  }
}
