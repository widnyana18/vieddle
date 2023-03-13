import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Subscription',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.sort,
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
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            color: Color(0xFF858585),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 8,       
        itemBuilder: (ctx, idx) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('asset/person.jpg'),
            ),
            title: Text(
              'Michael Liver',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: CircleAvatar(
              backgroundColor: Color(0xFFF27496),
              radius: 7,
              child: Text(
                'N',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
            dense: true,
            onTap: () {},
          );
        },
      ),
    );
  }

  List<String> popupList = ['Top Owner', 'Popular', 'A-Z', 'Date'];
}

class SubsTileData {
  SubsTileData({this.photo, this.name, this.onTap});

  final String photo;
  final String name;
  final VoidCallback onTap;
}
