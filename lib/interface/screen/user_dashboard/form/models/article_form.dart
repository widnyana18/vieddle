import 'package:flutter/material.dart';

class ArticleForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Color(0xFF858585),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Color(0xFF858585),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Color(0xFF858585),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {},
              color: Color(0xFFF6B16C),
              tooltip:
                  "Make your article just upload file you can publish many content in"
                  "all genre without make on step by step Just Support PDF file, you can"
                  "upload more but just once file saved, and you can edit article in this field but wasn't  modify styling.",
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LayoutBuilder(
              builder: (ctx, transition) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.note_add),
                      iconSize: 18,
                      color: Color(0xFF858585),
                      onPressed: () {},
                    ),
                    Text(
                      'Upload File',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
                // return SingleChildScrollView(
                //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [],),
                // ),
              },
            ),
          ),
        ),
        SizedBox(height: 15),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Enable Comment',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            "If doesn't enabled user can't comment your content",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          value: true,
          onChanged: (val) {},
          activeColor: Color(0xFFF27496),
          inactiveThumbColor: Color(0xFF858585),
        ),
        SizedBox(height: 15),
        RaisedButton(
          child: Text('Publish Article'),
          onPressed: () {},
          color: Color(0xFFE36789),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
