import 'package:flutter/material.dart';

import 'package:vieddle/interface/screen/details/widgets/widgets.dart';
import 'package:vieddle/interface/util/utils.dart';

class ModelArtistPage extends StatefulWidget {
  @override
  _ModelArtistPageState createState() => _ModelArtistPageState();
}

class _ModelArtistPageState extends State<ModelArtistPage> {
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
                  child: GalleryPhoto(),
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
        backgroundColor: Color(0xFFF9F9F9),
        bottomSheet: BottomSheet(
          builder: (ctx) => SizedBox(
            height: size.height * .74,
            child: CommentBar(),
          ),
          onClosing: () {},
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: GalleryPhoto(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                minHeight: 32,
                maxHeight: 65,
                child: Text(
                  'Animals Under The Bed Animals Under The Bed',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15.0),
              sliver: SliverToBoxAdapter(
                child: Material(
                  color: Colors.white,
                  elevation: 8,
                  child: Column(
                    children: <Widget>[
                      ContentPreviewBar(),
                      SizedBox(height: 18),
                      Text(
                        'met consectetur adipisicing elit. Exercitationem tempore impedit autem consectetur qui'
                        'am met consectetur adipisicing elit. Exercitationem tempor you interest, check details to get',
                      ),
                      SizedBox(height: 18),
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
                      SizedBox(height: 18),
                    ],
                  ),
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
