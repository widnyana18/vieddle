import 'package:flutter/material.dart';

import 'package:vieddle/interface/features/card/cards.dart';
import 'package:vieddle/interface/features/searchBar.dart';
import 'package:vieddle/interface/screen/user_dashboard/widgets/dashboard_widgets.dart';
import 'package:vieddle/interface/util/utils.dart';

List<String> addDataList = [
  'Tutorial Video',
  'Model Artist',
  'Article',
  'Album',
  'Product',
  'Collection',
];

List<String> filterList = [
  'Tutorial Video',
  'Model Artist',
  'Article',
  'Cosmetic',
  'Accessories',
  'Magazine',
  'Collection',
];

class ItemGridAtr {
  static Widget addBtnWidget(List<String> popupList) {
    return PopupMenuButton(
      icon: Icon(
        Icons.add_box,
        color: Color(0xFF858585),
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
    );
  }
}

class ItemGrid extends StatelessWidget {
  static Widget regularRole() {
    List<String> filterRegular = filterList..removeAt(3);
    List<String> addDataRegular = addDataList..removeAt(4);

    return ResponsiveLayout(
      largeScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 320,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (ctx, idx) {
          return ContentCard();
        },
        itemCount: 12,
      ),
      smallScreen: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Offstage(
              offstage: false,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: CreditCard(),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: SliverHeaderDelegate(
              minHeight: 40,
              maxHeight: 40,
              child: SearchBar(popupData: filterRegular),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              minHeight: 40,
              maxHeight: 40,
              child: Offstage(
                offstage: false,
                child: Center(
                  child: ItemGridAtr.addBtnWidget(addDataRegular),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) => Padding(
                padding: EdgeInsets.all(15),
                child: ContentCard(),
              ),
              childCount: 5,
            ),
            itemExtent: 225,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ResponsiveLayout(
        largeScreen: Column(
          children: [
            TabBar(
              indicatorColor: Color(0xFFE36789),
              unselectedLabelColor: Color(0xFF858585),
              labelColor: Color(0xFFE36789),
              tabs: [
                Tab(text: 'Products'),
                Tab(text: 'Gallery'),
              ],
              onTap: (idx) {},
            ),
            Flexible(
              child: TabBarView(
                children: <Widget>[
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 185,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: .8,
                    ),
                    itemBuilder: (ctx, idx) {
                      return ContentCard();
                    },
                    itemCount: 12,
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 320,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (ctx, idx) {
                      return ContentCard();
                    },
                    itemCount: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
        smallScreen: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  CompanyDesc(),
                  Offstage(
                    offstage: false,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CreditCard(),
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                minHeight: 40,
                maxHeight: 40,
                child: SearchBar(popupData: filterList),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                minHeight: 40,
                maxHeight: 40,
                child: Row(
                  children: <Widget>[
                    Offstage(
                      offstage: false,
                      child: ItemGridAtr.addBtnWidget(addDataList),
                    ),
                    Flexible(
                      child: TabBar(
                        indicatorColor: Color(0xFFE36789),
                        unselectedLabelColor: Color(0xFF858585),
                        labelColor: Color(0xFFE36789),
                        tabs: [
                          Tab(text: 'Products'),
                          Tab(text: 'Gallery'),
                        ],
                        onTap: (idx) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: .8,
                      ),
                      itemBuilder: (ctx, idx) {
                        return ContentCard();
                      },
                      itemCount: 12,
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (ctx, idx) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: ContentCard(),
                    ),
                    itemExtent: 225,
                    itemCount: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
