import 'package:flutter/material.dart';

class Itemlist extends StatelessWidget {
  const Itemlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white70),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,

            // SkeletonAnimation method
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                child: Image.asset('assets/cofee.jpg'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          width: 60,
                          height: 13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Text('346'))
            ],
          ),
        ),
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
