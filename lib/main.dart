import 'package:drawer/screens/add.dart';
import 'package:drawer/screens/home.dart';
import 'package:drawer/screens/profile.dart';
import 'package:drawer/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
      home: SafeArea(
        child: MainWidget(
          current: 0,
          pages: [ProfileScreen(), AddScreen(), SearchScreen(), HomeScreen()],
        ),
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({required this.current, required this.pages});

  int current;

  List pages = [];

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: widget.pages[widget.current],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent.shade100,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green.shade900,
          unselectedItemColor: Colors.green,
          currentIndex: widget.current,
          onTap: (int index) {
            setState(() {
              widget.current = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: 'پروفایل', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'افزودن', icon: Icon(Icons.add)),
            BottomNavigationBarItem(label: 'جستجو', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'خانه', icon: Icon(Icons.home)),
          ],
        ),
      ),
    );
  }
}
