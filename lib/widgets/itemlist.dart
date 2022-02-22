import 'package:flutter/material.dart';

class Itemlist extends StatelessWidget {
  const Itemlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.red),
          child: const ListTile(
            leading: const CircleAvatar(
                backgroundImage: const AssetImage('assets/1024.png')),
            title: Text('Espresso'),
            trailing: Text('95/-'),
          ),
        ),
        const ListTile(
          tileColor: Colors.brown,
          leading: const CircleAvatar(
              backgroundImage: const AssetImage('assets/1024.png')),
          title: Text('Espresso'),
          trailing: Text('95/-'),
        )
      ],
    );
  }
}
