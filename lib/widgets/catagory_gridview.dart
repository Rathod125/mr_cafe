import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/categories.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CategoryLogo(
                  cname: 'capaccino',
                  onpress: () {
                    Navigator.pushNamed(context, Categories.id);
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
        ),
      ],
    );
  }
}

class CategoryLogo extends StatelessWidget {
  CategoryLogo({required this.cname, required this.onpress});
  String cname;
  VoidCallback onpress;

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
          style: TextStyle(fontSize: 20, color: Color(0xFF212325)),
        ),
      ]),
    );
  }
}
