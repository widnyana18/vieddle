import 'package:flutter/material.dart';
import 'package:vieddle/interface/screen/user_dashboard/widgets/item_grid.dart';

import 'package:vieddle/interface/util/responsiveLayout.dart';

class DashboardNav extends StatefulWidget {
  @override
  _DashboardNavState createState() => _DashboardNavState();
}

class _DashboardNavState extends State<DashboardNav> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: NavigationRail(
        leading: ItemGridAtr.addBtnWidget(filterList),
        elevation: 1.2,
        groupAlignment: 0,
        destinations: destination
            .map((item) => NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(item.label),
                ))
            .toList(),
        selectedIndex: _selectedIndex,
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFE36789),
      ),
    );
  }

  List<String> filterList = [
    'Product',
    'Collection',
    'Tutorial Video',
    'Model Artist',
    'Article',
    'Album'
  ];

  List<DashboardNavEntity> destination = [
    DashboardNavEntity(
      icon: Icons.widgets,
      label: 'Gallery',
    ),
    DashboardNavEntity(
      icon: Icons.collections_bookmark,
      label: 'Bookmark',
    ),
    DashboardNavEntity(
      icon: Icons.favorite,
      label: 'Favorite',
    ),
    DashboardNavEntity(
      icon: Icons.subscriptions,
      label: 'Subs',
    ),
    DashboardNavEntity(
      icon: Icons.insert_chart,
      label: 'Purchase',
    ),
    DashboardNavEntity(
      icon: Icons.show_chart,
      label: 'Sales',
    ),
  ];
}

class DashboardNavEntity {
  DashboardNavEntity({this.icon, this.label});

  final IconData icon;
  final String label;
}
