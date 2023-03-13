import 'package:flutter/material.dart';

import 'package:vieddle/interface/features/widgets.dart';
import 'package:vieddle/interface/screen/user_dashboard/screen/screens.dart';
import 'package:vieddle/interface/screen/user_dashboard/widgets/dashboard_widgets.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class PersonalDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SearchBar(popupData: filterList),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              color: Color(0xFF858585),
            ),
          ],
        ),
        drawer: SettingsPage(),
        endDrawer: null,
        floatingActionButton: FloatingBtn(
          icon: Icons.chat,
          label: '26',
          onTap: () {},
        ),
        body: Row(
          children: <Widget>[
            Flexible(child: DashboardNav()),
            SizedBox(width: 20),
            Flexible(flex: 12, child: ItemGrid()),
            SizedBox(width: 20),
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
                      child: UserProfileCard(showAllDesc: true),
                    ),
                    SizedBox(height: 18),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CompanyDesc(),
                    ),
                    SizedBox(height: 18),
                    CreditCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      smallScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        floatingActionButton: FloatingBtn(
          icon: Icons.chat,
          label: '26',
          onTap: () {},
        ),
        bottomNavigationBar: DashboardNav(),
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 255,
              backgroundColor: Colors.white,
              pinned: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xFF858585),
                  ),
                  onPressed: () {},
                ),
              ],
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
