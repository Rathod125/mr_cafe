import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_cafe/screens/item.dart';
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
  bool isLoding = false;
  late List<String> names;
  late int j;
  late List<String> photos;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoding = true;
    });
    final data = await rootBundle.loadString("assets/data.json");
    var jsonD = jsonDecode(data);
    print(jsonD.runtimeType);
    List iname = jsonD['iname'];
    List<String> name = iname.cast<String>();
    List<dynamic> iphoto = jsonD['iphoto'];
    List<String> photo = iphoto.cast<String>();

    setState(() {
      names = name;
      photos = photo;
      isLoding = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAutoCompleteData();
  }

  // ScrollController _scroll = ScrollController(initialScrollOffset: 50.0);
  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context);
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
                    onSelected: (selectedValue) {
                      // for (int i = 0; i < names.length; i++) {
                      //   if (selectedValue == names[i]) {
                      //     j = i;
                      //   }
                    },
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: ((context) {
                    //       return Item(
                    //           itemname: selectedValue.toString(),
                    //           description: 'd',
                    //           price: '240',
                    //           imageProvider: AssetImage(photos[j]));
                    //     }),
                    //   ),
                    // );

                    optionsViewBuilder:
                        (context, Function(String) onSelected, options) {
                      // Navigator.pop(context);

                      return Material(
                        elevation: 50,
                        child: Container(
                          height: 100,
                          color: Color(0xFFEADBCC),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              var option = options.elementAt(index);
                              var photo = photos.elementAt(index);
                              return ListTile(
                                tileColor: Color(0xFFEADBCC),
                                onTap: () {
                                  for (int i = 0; i < names.length; i++) {
                                    if (option.toString() == names[i]) {
                                      j = i;
                                    }
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) {
                                        return Item(
                                            itemname: option.toString(),
                                            description: 'd',
                                            price: '240',
                                            imageProvider:
                                                AssetImage(photos[j]));
                                      }),
                                    ),
                                  );
                                },
                                leading: Image(
                                  image: AssetImage('assets/logo.png'),
                                ),
                                title: Text(option.toString()),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                              );
                            },

                            // shrinkWrap: true,
                          ),
                        ),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return SizedBox(
                        height: 50,
                        child: TextField(
                          focusNode: focusNode,
                          onTap: () {
                            setState(() {
                              focusNode.addListener(() {
                                if (focusNode.hasFocus) {
                                  hintText = '';
                                } else {
                                  hintText = 'Search';
                                }
                              });
                            });
                          },
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
