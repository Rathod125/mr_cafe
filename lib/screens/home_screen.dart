import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  FocusNode focusNod = FocusNode();
  bool colour = true;
  String hintText = 'Search';
  bool isLoding = false;
  late List<String> names;
  // late List<String> photos;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoding = true;
    });
    final data = await rootBundle.loadString("assets/data.json");
    var jsonD = jsonDecode(data);
    print(jsonD.runtimeType);
    List iname = jsonD['iname'];
    List<String> name = iname.cast<String>();
    // List<dynamic> iphoto = json[0]['iphoto'];
    // List<String> photo = iphoto.cast<String>();

    setState(() {
      names = name;
      // photos = photo;
      isLoding = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAutoCompleteData();
    focusNod.addListener(() {
      if (focusNod.hasFocus) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      } else {
                        return names.where((word) => word
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()));
                      }
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return SizedBox(
                        height: 50,
                        child: TextField(
                          focusNode: focusNode,
                          // onTap: () {
                          //   setState(() {
                          //     focusNode = focusNod;
                          //   });
                          // },
                          controller: controller,
                          onEditingComplete: onEditingComplete,
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
                      );
                    },
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
