import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MobileBottomNavbar extends StatefulWidget {
  @override
  _MobileBottomNavbarState createState() => _MobileBottomNavbarState();
}

class _MobileBottomNavbarState extends State<MobileBottomNavbar> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: fullNavItem.map((item) => item).toList(),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFE36789),
    );
  }

  List<BottomNavigationBarItem> get fullNavItem => [
    BottomNavigationBarItem(
      icon: Icon(MaterialCommunityIcons.spray_bottle),
      title: Text('Shopping'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_library),
      title: Text('fashion'),
    ),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        child: Image.asset(
          'assets/person.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
}
