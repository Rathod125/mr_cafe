import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mr_cafe/screens/categories.dart';
import 'package:mr_cafe/screens/home_screen.dart';
import 'package:mr_cafe/screens/login_screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);
  static const String id = 'main_home';

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // print(index);
      if (index == 0) {
        // Navigator.pushNamed(context, HomePage.id);
      } else if (index == 1) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) {
        //       return Categories();
        //     }),
        //   ),
        // );
      } else if (index == 2) {
        // Navigator.pushNamed(context, HomePage.id);
      }
    });
  }

  void logout() async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, LoginPage.id);
  }

  static const List _pages = [
    HomePage(),
    Categories(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADBCC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEADBCC),
        iconTheme: const IconThemeData(color: Color(0xFF212325)),
        title: const Text(
          'CafeApp',
          style: TextStyle(color: Color(0xFF212325)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // mouseCursor: SystemMouseCursors.grab,
        backgroundColor: Color(0xFFD4C7B7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        // fixedColor: Colors.red,
        // selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFFC59451),
          size: 25,
        ),
        selectedItemColor: Color(0xFFC59451),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        unselectedItemColor: Color(0xFF867D76),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 15,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}
