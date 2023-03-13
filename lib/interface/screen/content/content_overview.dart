import 'package:flutter/material.dart';

import 'package:vieddle/interface/features/card/cards.dart';
import 'package:vieddle/interface/features/widgets.dart';
import 'package:vieddle/interface/screen/content/widgets/widgets.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class ContentOverview extends StatefulWidget {
  @override
  _ContentOverviewState createState() => _ContentOverviewState();
}

class _ContentOverviewState extends State<ContentOverview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isLarge = ResponsiveLayout.isLargeScreen(context);

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      endDrawer: Drawer(child: NotifApp()),
      bottomNavigationBar: isLarge ? null : MobileBottomNavbar(),
      body: ResponsiveLayout(
        largeScreen: CustomScrollView(
          slivers: <Widget>[
            AppBarWeb(
              bgColor: Color(0xFF382531),
              height: size.height,
              bottomWidget: SlideShow(),
            ),
            ContentMenuIndex(),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: size.width * .07),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Most Wanted',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '15 product',
                      style: TextStyle(
                        color: Color(0xFF858585),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  crossAxisCount: 4,
                  childAspectRatio: 1.4,
                ),
                delegate: SliverChildBuilderDelegate(
                  (ctx, idx) => ContentCard(),
                  childCount: 8,
                ),
              ),
            ),
          ],
        ),
        smallScreen: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: size.height * .42,
              title: Text(
                'Fashion',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.dashboard,
                    color: Color(0xFF858585),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                  color: Color(0xFF858585),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(background: SlideShow()),
              backgroundColor: Colors.white,
              pinned: true,
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 25, left: 15),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Most Wanted',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: LimitedBox(
                maxHeight: 225,
                child: ListView.builder(
                  itemExtent: 310,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, idx) => Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: ContentCard(),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 25, left: 15),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'New Realease',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: LimitedBox(
                maxHeight: 225,
                child: ListView.builder(
                  itemExtent: 310,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, idx) => Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: ContentCard(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
