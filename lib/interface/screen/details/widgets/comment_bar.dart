import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  Widget commentField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/person.jpg'),
          radius: 16,
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mafrodd Linoar',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Something Here',
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 16,
                  color: Color(0xFF858585),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget reviewTile(
    CommentAtr data, {
    List<String> popupData,
    bool showReplyBtn = true,
    List<Widget> children,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(data.photo),
          radius: 16,
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      hoverColor: Color(0xFFE36789),
                      onTap: () {},
                      child: Text(
                        data.name,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      data.date,
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Color(0xFF858585),
                  ),
                  itemBuilder: (_) {
                    return popupData.map((item) {
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
              ],
            ),
            SizedBox(height: 6),
            Text(data.msg),
            Row(
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
                SizedBox(width: 8),
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
            Offstage(
              offstage: !showReplyBtn,
              child: ExpansionTile(
                title: Text(
                  '8 replies',
                  style: TextStyle(color: Color(0xFFF6B16C), fontSize: 12),
                ),
                children: children,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Comment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.rate_review,
                  size: 16,
                  color: Color(0xFF858585),
                ),
                Text(
                  '387',
                  style: TextStyle(color: Color(0xFF858585)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 6),
        commentField(),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: reviewProdList.length,
            itemBuilder: (ctx, idx) {
              if (reviewProdList[idx].reply == null) {
                return reviewTile(
                  reviewProdList[idx],                  
                  children: [],
                );
              }
              return reviewTile(
                reviewProdList[idx],
                children: List.generate(
                  reviewProdList[idx].reply.length,
                  (i) {
                    return reviewTile(
                      reviewProdList[idx].reply[i],
                      showReplyBtn: false,
                      children: [],
                    );
                  },
                )..insert(0, commentField()),
                // Container(
                //   padding: EdgeInsets.all(6),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFF3F3F3),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child:
                // ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<CommentAtr> reviewProdList = [
    CommentAtr(
      photo: 'assets/person.jpg',
      name: 'Mamang Sinaga',
      date: '2 weeks ago',
      msg: 'Be Yourself and Never Surender. lmao I Joke to You theres lot',
      reply: [
        CommentAtr(
          photo: 'assets/person.jpg',
          name: 'Mamang Sinaga',
          date: '2 weeks ago',
          msg: 'Be Yourself and Never Surender. lmao I Joke to You theres lot ',
        ),
        CommentAtr(
          photo: 'assets/person.jpg',
          name: 'Mamang Sinaga',
          date: '2 weeks ago',
          msg: 'Be Yourself and Never Surender. lmao I Joke to You theres lot ',
        ),
      ],
    ),
    CommentAtr(
      photo: 'assets/person.jpg',
      name: 'Moria Bridg',
      date: '2 weeks ago',
      msg:
          'Be Yourself and Never Surender. lmao I Joke to You theres lot more information',
    ),
    CommentAtr(
      photo: 'assets/person.jpg',
      name: 'Yellow Stone',
      date: '2 weeks ago',
      msg:
          'you interest, check details to get more information. you interest, check details to get more information',
    ),
  ];
}

class CommentAtr {
  CommentAtr({this.photo, this.name, this.date, this.msg, this.reply});

  final String photo;
  final String name;
  final String date;
  final String msg;
  final List<CommentAtr> reply;
}
