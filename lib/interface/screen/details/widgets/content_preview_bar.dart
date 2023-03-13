import 'package:flutter/material.dart';

class ContentPreviewBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(
          offstage: false,
          child: ListTile(
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
        Row(
          children: [
            Text('6.6'),
            Icon(
              Icons.star,
              size: 14,
              color: Color(0xFF858585),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Color(0xFF858585),
              ),
            ),
            Text('376 views'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Color(0xFF858585),
              ),
            ),
            Text(
              '2 weeks ago',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Material(
                color: Colors.white,
                elevation: 6,
                shape: StadiumBorder(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoiceChip(
                      backgroundColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      avatar: Icon(
                        Icons.thumb_up,
                        color: Color(0xFFE36789),
                        size: 16,
                      ),
                      label: Text(
                        '4.1k',
                        style: TextStyle(
                          color: Color(0xFFE36789),
                        ),
                      ),
                      onSelected: (_) {},
                      selected: true,
                    ),
                    CircleAvatar(backgroundColor: Color(0xFF858585), radius: 3),
                    ChoiceChip(
                      backgroundColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      avatar: Icon(
                        Icons.thumb_down,
                        color: Color(0xFF858585),
                        size: 16,
                      ),
                      label: Text(
                        '46',
                        style: TextStyle(
                          color: Color(0xFF858585),
                        ),
                      ),
                      onSelected: (_) {},
                      selected: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
              color: Color(0xFF858585),
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {},
              color: Color(0xFF858585),
            ),
          ],
        ),
      ],
    );
  }
}
