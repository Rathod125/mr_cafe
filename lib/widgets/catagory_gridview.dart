import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/categories.dart';

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
                    return const Categories(title: 'Hot Coffee');
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
                onpress: () {},
                images: AssetImage(
                  'assets/coldcoffee/icedespresso.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Manual Brew',
                onpress: () {},
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
                onpress: () {},
                images: AssetImage(
                  'assets/frappe/mocha.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Lemonade',
                onpress: () {},
                images: AssetImage(
                  'assets/lemonade/kiwi.jpeg',
                ),
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Desserts',
                onpress: () {},
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
