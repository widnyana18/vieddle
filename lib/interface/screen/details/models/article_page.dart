import 'package:flutter/material.dart';

import 'package:vieddle/interface/screen/details/widgets/widgets.dart';
import 'package:vieddle/interface/util/utils.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ResponsiveLayout(
      largeScreen: BottomSheet(
        onClosing: () {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        elevation: 20,
        builder: (ctx) {
          return LimitedBox(
            maxHeight: size.height * .85,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContentPreviewBar(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(),
                        ),
                        Expanded(child: CommentBar()),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(),
                Flexible(
                  flex: 5,
                  child: Material(
                    color: Color(0xFFF9F9F9),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: ArticlePaper(),
                      ),
                    ),
                  ),
                ),
                VerticalDivider(),
                Flexible(
                  flex: 2,
                  child: ContentSelectionList(),
                ),
              ],
            ),
          );
        },
      ),
      smallScreen: Scaffold(
        bottomSheet: BottomSheet(
          builder: (ctx) => SizedBox(
            height: size.height * .74,
            child: CommentBar(),
          ),
          onClosing: () {},
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 120,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: ContentPreviewBar(),
                title: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/person.jpg'),
                  ),
                  title: Text(
                    'Meg Smiley',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.person_add),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    ArticlePaper(),
                    SizedBox(height: 15),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                      ),
                      title: Text(
                        'Lauren Marshall',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Be Yourself and Never Surender. lmao I Joke to You theres lot more information',
                        maxLines: 2,
                      ),
                      isThreeLine: true,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                minHeight: 30,
                maxHeight: 30,
                child: ContentSelectionList.category(categoryList),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: ContentSelectionList.sliver(),
            ),
          ],
        ),
      ),
    );
  }

  List<String> categoryList = [
    'Album',
    'Similar',
    'Perfume',
    'Rodrigues',
    'New'
  ];
}
