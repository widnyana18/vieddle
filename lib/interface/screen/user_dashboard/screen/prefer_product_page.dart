import 'package:flutter/material.dart';
import 'package:vieddle/interface/features/card/mini_card.dart';

class PreferredProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Preferred Product',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.equalizer,
              color: Color(0xFFDFDFDF),
            ),
            itemBuilder: (_) {
              return popupList.map((item) {
                return PopupMenuItem(
                  child: Text(
                    item,
                    style: TextStyle(color: Color(0xFFDFDFDF)),
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
      body: ListView.builder(
        itemCount: 8,
        itemExtent: 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (ctx, idx) {
          return ContentMiniCard();
        },
      ),
    );
  }

  List<String> popupList = [
    'All',
    'Top Rated',
    'Cosmetic',
    'Accessories',
    'Magazine',
    'Collection',
    'Tutorial Video',
    'Model Artist',
    'Article',
  ];
}
