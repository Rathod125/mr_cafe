import 'package:flutter/material.dart';
import 'package:mr_cafe/widgets/catagory_gridview.dart';

import '../widgets/menutabbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool colour = true;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF212325),
                    ),
                    filled: true,
                    fillColor: Color(0xFFDACABD),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        height: 2.7,
                        color: Color.fromARGB(255, 81, 85, 90),
                        fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Catagories',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 25, color: Color(0xFF212325)),
              ),
            ),
            CategoriesList(),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
