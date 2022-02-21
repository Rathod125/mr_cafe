import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool colour = true;

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

  // ScrollController _scroll = ScrollController(initialScrollOffset: 50.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEADBCC),
        iconTheme: const IconThemeData(color: Color(0xFF212325)),
        title: const Text(
          'CafeApp',
          style: TextStyle(color: Color(0xFF212325)),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: const Color(0xFFEADBCC),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF212325),
                  ),
                  filled: true,
                  fillColor: Color(0xFFDACABD),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 81, 85, 90), fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 40,
                child: DefaultTabController(
                  length: 5,
                  child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange),
                    tabs: [
                      Tab(
                        child: Text("All"),
                      ),
                      Tab(
                        child: Text("All"),
                      ),
                      Tab(
                        child: Text("All"),
                      ),
                      Tab(
                        child: Text("All"),
                      ),
                      Tab(
                        child: Text("All"),
                      ),
                    ],
                  ),
                )
                // child: ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   // controller: _scroll,
                //   itemCount: items.length,
                //   itemBuilder: ((context, index) {
                //     return GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           colour = !colour;
                //         });
                //       },
                //       child: Container(
                //         constraints: BoxConstraints(minWidth: 50),
                //         padding: EdgeInsets.all(10),
                //         margin: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(30),
                //           color: colour ? Color(0xFFDACABD) : Colors.orange,
                //         ),
                //         child: Text(
                //           items[index],
                //           textAlign: TextAlign.center,
                //           style: TextStyle(fontSize: 17),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                ),
            // Container(
            //   height: 500,
            //   child: Text('h'),
            // )
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
