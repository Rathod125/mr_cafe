import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mr_cafe/constants.dart';
import 'package:mr_cafe/screens/item.dart';
import 'package:mr_cafe/screens/login_screen.dart';
import 'package:mr_cafe/widgets/catagory_gridview.dart';
import 'package:mr_cafe/widgets/toppicks.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  late List<String> descriptions;
  late List<String> prices;
  TextEditingController controller = TextEditingController();
  SuggestionsBoxController suggestionsBoxController =
      SuggestionsBoxController();
  Future fetchAutoCompleteData() async {
    setState(() {
      isLoding = true;
    });
    final data = await rootBundle.loadString("assets/data.json");
    var jsonD = jsonDecode(data);
    print(jsonD.runtimeType);
    List iname = jsonD['iname'];
    List<String> name = iname.cast<String>();
    List<dynamic> description = jsonD['description'];
    List<String> des = description.cast<String>();
    List<dynamic> iphoto = jsonD['iphoto'];
    List<String> photo = iphoto.cast<String>();
    List<dynamic> iprice = jsonD['prices'];
    List<String> price = iprice.cast<String>();

    setState(() {
      names = name;
      descriptions = des;
      photos = photo;
      prices = price;
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
                  child: TypeAheadField(
                    // suggestionsBoxController: suggestionsBoxController,
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        elevation: 0.0,
                        color: kBackGroundColor.withOpacity(0.9)),
                    textFieldConfiguration: TextFieldConfiguration(
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
                            // height: 2.7,
                            color: Color.fromARGB(255, 81, 85, 90),
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    suggestionsCallback: (String pattern) {
                      if (pattern.isEmpty) {
                        return const Iterable<String>.empty();
                      } else {
                        return names.where(
                          (word) => word.toLowerCase().contains(
                                pattern.toLowerCase(),
                              ),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context, names) {
                      return Container(
                        height: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(color: Colors.transparent),

                        // leading: Image(
                        //   image: AssetImage('assets/logo.png'),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: SubstringHighlight(
                            text: names.toString(),
                            term: controller.text,
                            textStyle: TextStyle(
                                fontSize: 19, color: Color(0xFF212325)),
                            textStyleHighlight:
                                TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    },
                    onSuggestionSelected: (String name) {
                      for (int i = 0; i < names.length; i++) {
                        if (name == names[i]) {
                          j = i;
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return Item(
                                itemname: name,
                                description: descriptions[j],
                                price: prices[j],
                                imageProvider: photos[j]);
                          }),
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
    );
  }
}
