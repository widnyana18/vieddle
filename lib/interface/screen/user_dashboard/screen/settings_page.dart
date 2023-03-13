import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () {},
                child: Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Store',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              RaisedButton(
                child: Text(
                  'Request New Id',
                  style: TextStyle(color: Color(0xFF858585)),
                ),
                onPressed: () {},
                color: Colors.white,
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () {},
                child: Text(
                  'Selling Shop',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () {},
                child: Text(
                  'Delete Shop',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sale',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () {},
                child: Text(
                  'Edit Shop Data',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 6),
              switchSetting(
                title: 'Activate Promotion',
                value: false,
                event: (val) {},
              ),
              SizedBox(height: 6),
              switchSetting(
                title: 'Mark Product Not Sold',
                value: true,
                event: (val) {},
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () {},
                child: Text(
                  'Reset Analytic',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Message',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
              switchSetting(
                title: 'Chat Bot',
                value: true,
                event: (val) {},
              ),
              SizedBox(height: 6),
              Text(
                'Message',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 6),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF858585)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Make Some Msg...',
                ),
              ),
              Text(
                'Message',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12),
            ]..addAll(
                List.generate(
                  notifList.length,
                  (idx) => switchSetting(
                    title: notifList[idx].title,
                    value: notifList[idx].value,
                    event: notifList[idx].event,
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }

  List<NotifFieldAtr> notifList = [
    NotifFieldAtr(
      title: 'Product Recommended',
      value: true,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Product Updates',
      value: false,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Product News',
      value: false,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Store Updates',
      value: false,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Income Progress',
      value: false,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Chat Box',
      value: true,
      event: (val) {},
    ),
    NotifFieldAtr(
      title: 'Shopping Details',
      value: true,
      event: (val) {},
    ),
  ];

  switchSetting({String title, bool value, Function(bool) event}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.0),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        value: value,
        onChanged: (val) {},
        activeColor: Color(0xFFF27496),
        inactiveThumbColor: Color(0xFF858585),
      ),
    );
  }
}

class NotifFieldAtr {
  NotifFieldAtr({this.title, this.value, this.event});

  final String title;
  final bool value;
  final Function(bool) event;
}
