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
                cname: 'capaccino',
                onpress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const Categories();
                  })));
                },
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Tea',
                onpress: () {},
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Desserts',
                onpress: () {},
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
                cname: 'capaccino',
                onpress: () {},
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Tea',
                onpress: () {},
              ),
            ),
            Expanded(
              child: CategoryLogo(
                cname: 'Desserts',
                onpress: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryLogo extends StatelessWidget {
  const CategoryLogo({Key? key, required this.cname, required this.onpress}) : super(key: key);
  final String cname;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(children: [
        const CircleAvatar(
          backgroundColor: Color(0xFF212325),
          radius: 42,
          child: CircleAvatar(
            backgroundColor: Color(0xFFEADBCC),
            radius: 40,
            child: Image(
              image: AssetImage(
                'assets/logo.png',
              ),
              // height: 100,
              // width: 100,
            ),
          ),
        ),
        Text(
          cname,
          maxLines: 1,
          style: const TextStyle(fontSize: 20, color: Color(0xFF212325)),
        ),
      ]),
    );
  }
}
