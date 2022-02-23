import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/categories.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, Categories.id);
            },
            title: const CircleAvatar(
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
            subtitle: const Text(
              "capaccino",
              maxLines: 1,
              style: TextStyle(fontSize: 20, color: Color(0xFF212325)),
            ),
          ),
        ),
        const Expanded(
          child: ListTile(
            title: CircleAvatar(
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
            subtitle: Text(
              "capaccino",
              style: TextStyle(fontSize: 20, color: Color(0xFF212325)),
            ),
          ),
        ),
        const Expanded(
          child: ListTile(
            title: CircleAvatar(
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
            subtitle: Text(
              "capaccino",
              style: TextStyle(fontSize: 20, color: Color(0xFF212325)),
            ),
          ),
        ),
      ],
    );
  }
}
