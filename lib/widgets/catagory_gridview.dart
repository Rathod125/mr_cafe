import 'package:flutter/material.dart';
import 'package:mr_cafe/Item_List/itemlist1.dart';
import 'package:mr_cafe/Item_List/itemlist2.dart';
import 'package:mr_cafe/Item_List/itemlist3.dart';
import 'package:mr_cafe/Item_List/itemlist4.dart';
import 'package:mr_cafe/Item_List/itemlist5.dart';
import 'package:mr_cafe/Item_List/itemlist6.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CategoryLogo(
                cname: 'Hot Coffee',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist1(title: 'Hot Coffee');
                  })));
                },
                images: AssetImage(
                  'assets/hotcoffee/capuccino.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Cold Coffee',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist2(title: 'Cold Coffee');
                  })));
                },
                images: AssetImage(
                  'assets/coldcoffee/icedespresso.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Manual Brew',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist3(title: 'Manual Brew');
                  })));
                },
                images: AssetImage(
                  'assets/manualbrew/Frenchpress.jpeg',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CategoryLogo(
                cname: 'Frappe',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist4(title: 'Frappe');
                  })));
                },
                images: AssetImage(
                  'assets/frappe/mocha.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Lemonade',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist5(title: 'Lemonade');
                  })));
                },
                images: AssetImage(
                  'assets/lemonade/kiwi.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Desserts',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Itemlist6(title: 'Desserts');
                  })));
                },
                images: AssetImage(
                  'assets/desserts/nutellacheesecake.jpeg',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryLogo extends StatelessWidget {
  const CategoryLogo(
      {Key? key,
      required this.cname,
      required this.onpress,
      required this.images})
      : super(key: key);
  final String cname;
  final VoidCallback onpress;
  final ImageProvider images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(children: [
        CircleAvatar(
          backgroundColor: Color(0xFFEADBCC),
          radius: 40,
          backgroundImage: images,
          // height: 100,
          // width: 100,
        ),
        Text(
          cname,
          // maxLines: 1,
          style: const TextStyle(fontSize: 15, color: Color(0xFF212325)),
        ),
      ]),
    );
  }
}
