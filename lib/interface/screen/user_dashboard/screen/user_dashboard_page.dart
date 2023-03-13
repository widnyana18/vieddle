import 'package:flutter/material.dart';

import 'package:vieddle/interface/features/widgets.dart';
import 'package:vieddle/interface/screen/user_dashboard/widgets/dashboard_widgets.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class UserDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SearchBar(popupData: filterList),
          actions: actionDashboard(),
        ),
        body: Row(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: UserProfileCard(showAllDesc: false),
                    ),
                    SizedBox(height: 18),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CompanyDesc(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(flex: 12, child: ItemGrid()),
          ],
        ),
      ),
      smallScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 255,
              backgroundColor: Colors.white,
              pinned: true,
              actions: actionDashboard(),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Roland Camel',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Owner Paramecium',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xFF858585),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                background: UserProfileCard.regular(),
              ),
            ),
          ],
          body: ItemGrid.regularRole(),
        ),
      ),
    );
  }

  List<Widget> actionDashboard() {
    return [
      ButtonTheme(
        minWidth: 35,
        height: 35,
        child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          borderSide: BorderSide(color: Color(0xFF858585)),
          padding: EdgeInsets.zero,
          child: Icon(Icons.equalizer, color: Color(0xFF858585)),
          onPressed: () {},
        ),
      ),
      PopupMenuButton(
        child: ButtonTheme(
          minWidth: 35,
          height: 35,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.zero,
            child: Icon(Icons.expand_more, color: Color(0xFF858585)),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
        itemBuilder: (_) {
          return popupList.map((item) {
            return PopupMenuItem(
              child: Text(
                item,
                style: TextStyle(color: Color(0xFF858585)),
              ),
              value: item,
            );
          }).toList();
        },
        // initialValue: initValue,
        onSelected: (value) {},
        offset: Offset(0, 120),
      ),
    ];
  }

  List<String> popupList = [
    'Share',
    'Subcriptions',
    'Chat',
  ];

  List<String> filterList = [
    'Cosmetic',
    'Accessories',
    'Magazine',
    'Collection',
    'Tutorial Video',
    'Model Artist',
    'Article',
  ];
}
