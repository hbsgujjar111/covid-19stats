import 'package:covid19app/homescreen.dart';
import 'package:covid19app/searchpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      body: Container(
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 54.0,
        backgroundColor: Colors.transparent,
        index: 0,
        color: Color(0xffDA0037),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Color(0xffededed),
          ),
          Icon(
            Icons.search_rounded,
            size: 30,
            color: Color(0xffededed),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchPage();
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Tabbar Error",
            ),
          ],
        );
    }
  }
}
