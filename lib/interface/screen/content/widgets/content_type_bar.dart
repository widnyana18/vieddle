import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class ContentTypeBar extends StatefulWidget {
  @override
  _ContentTypeBarState createState() => _ContentTypeBarState();
}

class _ContentTypeBarState extends State<ContentTypeBar> {
  var currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: NavigationRail(
        elevation: 1.2,
        groupAlignment: 0,
        destinations: destination.map(
          (item) => NavigationRailDestination(
            icon: Icon(item.icon),
            label: Text(item.label),
          ),
        ),
        selectedIndex: currentIdx,
        selectedIconTheme: IconThemeData(color: Color(0xFFE36789)),
        selectedLabelTextStyle: TextStyle(color: Color(0xFFE36789)),
        backgroundColor: Colors.white,
        onDestinationSelected: _onItemTapped,
      ),
      smallScreen: BottomNavigationBar(
        items: destination
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  title: Text(item.label),
                ))
            .toList(),
        onTap: _onItemTapped,
        currentIndex: currentIdx,
        selectedItemColor: Color(0xFFE36789),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIdx = index;
    });
  }

  List<ContentNavEntity> destination = [
    ContentNavEntity(
      icon: Icons.slow_motion_video,
      label: 'Tutorial',
    ),
    ContentNavEntity(
      icon: Icons.photo,
      label: 'Model Artist',
    ),
    ContentNavEntity(
      icon: AntDesign.paperclip,
      label: 'Article',
    ),
    ContentNavEntity(
      icon: Icons.photo_album,
      label: 'Album',
    ),
    ContentNavEntity(
      icon: Icons.view_comfy,
      label: 'all',
    ),
  ];
}

class ContentNavEntity {
  ContentNavEntity({this.icon, this.label});

  final IconData icon;
  final String label;
}
