import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:mr_cafe/widgets/catagory_gridview.dart';
import 'package:mr_cafe/widgets/toppicks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  FocusNode focusNode = FocusNode();
  bool colour = true;
  String hintText = 'Search';
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Search';
      }
      setState(() {});
    });
  }

 

  // ScrollController _scroll = ScrollController(initialScrollOffset: 50.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFFEADBCC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      focusNode: focusNode,
                      cursorColor: Color.fromARGB(255, 81, 85, 90),
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF212325),
                        ),
                        focusColor: Color.fromARGB(255, 81, 85, 90),
                        filled: true,
                        fillColor: Color(0xFFDACABD),
                        hintText: hintText,
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
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Categories',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF212325),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CategoriesList(),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    'Top Picks For You',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF212325),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Toppickes(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const Bottombar(),
    );
  }
}
