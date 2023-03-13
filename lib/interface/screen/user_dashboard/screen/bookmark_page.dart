import 'package:flutter/material.dart';
import 'package:vieddle/interface/features/card/mini_card.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Bookmark',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
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
}
