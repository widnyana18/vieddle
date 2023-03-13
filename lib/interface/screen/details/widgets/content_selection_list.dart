import 'package:flutter/material.dart';
import 'package:vieddle/interface/features/card/mini_card.dart';

class ContentSelectionList extends StatelessWidget {
  static Widget category(List<String> categoryList) {
    return LimitedBox(
      maxHeight: 30,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: ChoiceChip(
              label: Text(categoryList[idx]),
              selected: false,
              labelStyle: TextStyle(color: Color(0xFF858585)),
              backgroundColor: Colors.transparent,
              selectedColor: Color(0xFFE36789),
              shape: StadiumBorder(
                side: BorderSide(color: Color(0xFF858585)),
              ),
              onSelected: (val) {},
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        padding: EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }

  static SliverFixedExtentList sliver() {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (ctx, idx) => ContentMiniCard(),
        childCount: 4,
      ),
      itemExtent: 85,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18),
        category(categoryList),
        SizedBox(height: 18),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              return ContentMiniCard();
            },
            itemCount: 6,
            itemExtent: 85,
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ],
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
