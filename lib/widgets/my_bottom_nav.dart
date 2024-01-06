// ignore_for_file: prefer_const_constructors

import 'package:catchy/scr/home_page/home.dart';
import 'package:catchy/scr/messages_page/messages_page.dart';
import 'package:catchy/scr/my_order_page/my_order_page.dart';
import 'package:catchy/scr/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;
  void ontapp(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    MyOrderPage(),
    MessagesPagee(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontapp,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.black,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        unselectedLabelStyle:
            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/order.svg'),
              label: 'My Order'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/messages.svg'),
              label: 'Messages'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/person.svg'),
              label: 'Profile'),
        ],
      ),
    );
  }
}
