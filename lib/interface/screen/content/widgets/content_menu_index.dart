import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vieddle/interface/util/sliver_header_delegate.dart';

class ContentMenuIndex extends StatefulWidget {
  @override
  _ContentMenuIndexState createState() => _ContentMenuIndexState();
}

class _ContentMenuIndexState extends State<ContentMenuIndex> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 32,
        maxHeight: 32,
        child: SizedBox(
          height: 32,
          child: Row(
            children: <Widget>[
              Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    buttonList.length,
                    (idx) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: OutlineButton(
                        onPressed: () {
                          setState(() => index = idx);
//              buttonList[idx].event;
                        },
                        shape: StadiumBorder(),
                        borderSide: BorderSide(
                          width: 2,
                          color: index == idx
                              ? Color(0xFFA74D76)
                              : Color(0xFF858585),
                        ),
                        child: Text(
                          buttonList[idx].text,
                          style: TextStyle(
                            color: index == idx
                                ? Color(0xFFA74D76)
                                : Color(0xFF858585),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Color(0xFF858585),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<MenuItem> buttonList = [
    MenuItem(text: 'Most Wanted', event: () {}),
    MenuItem(text: 'New Realease', event: () {}),
    MenuItem(text: 'Viral Challenge', event: () {}),
    MenuItem(text: 'Face Care', event: () {}),
    MenuItem(text: 'Daily', event: () {}),
    MenuItem(text: 'Suggest For You', event: () {}),
    MenuItem(text: 'Make Tips', event: () {}),
  ];
}

class MenuItem {
  MenuItem({this.text, this.event});

  final String text;
  final VoidCallback event;
}
