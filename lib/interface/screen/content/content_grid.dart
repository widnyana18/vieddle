import 'package:flutter/material.dart';
import 'package:vieddle/interface/features/card/content_card.dart';

import 'package:vieddle/interface/features/widgets.dart';
import 'package:vieddle/interface/screen/content/widgets/widgets.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class ContentGrid extends StatefulWidget {
  @override
  _ContentGridState createState() => _ContentGridState();
}

class _ContentGridState extends State<ContentGrid> {
  @override
  Widget build(BuildContext context) {
    var isLarge = ResponsiveLayout.isLargeScreen(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: SearchBar(usePopupMenu: false),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(size.height * .82),
      //   child: CatalogFilter(),
      // ),
    ),
      backgroundColor: Color(0xFFF9F9F9),      
      bottomNavigationBar: isLarge ? null : ContentTypeBar(),
      body: LimitedBox(
        maxHeight: size.height - 50,
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: isLarge ? Axis.horizontal : Axis.vertical,
          children: <Widget>[
            ResponsiveLayout(
              largeScreen: Flexible(child: ContentTypeBar()),
              smallScreen: SizedBox.shrink(),
            ),
            Flexible(
              flex: 16,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 12, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Top Rated',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 12, 5, 0),
                          transform: Matrix4.identity()..scale(0.8),
                          child: Chip(
                            backgroundColor: Colors.transparent,
                            label: Text(
                              'Dark',
                              style: TextStyle(
                                color: Color(0xFFE36778),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            deleteIcon: Icon(Icons.cancel, size: 15),
                            deleteIconColor: Color(0xFFE36778),
                            onDeleted: () {},
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Color(0xFFE36778),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      flex: 14,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: GridView.builder(
                          gridDelegate:
                               SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 310,
                            mainAxisSpacing: 18.0,
                            crossAxisSpacing: 18.0,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return ContentCard();
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          recommendProduct.length,
                          (idx) => Transform(
                            transform: Matrix4.identity()..scale(0.8),
                            child: ChoiceChip(
                              label: Text(
                                recommendProduct[idx],
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              shape: StadiumBorder(
                                side: BorderSide(color: Colors.grey),
                              ),
                              backgroundColor: Colors.transparent,
                              selected: false,
                              onSelected: (_) {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }  

  List<String> recommendProduct = [
    'Woman',
    'Rose',
    'Glamour',
    'Sweetnest',
    'Flowers',
    'Potion'
  ];
}
