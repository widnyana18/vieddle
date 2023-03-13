import 'package:flutter/material.dart';

class AccountProfile extends StatefulWidget {
  final Color bgColor;

  AccountProfile({this.bgColor});

  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  dynamic initValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 230,
          height: 50,
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        PopupMenuButton(
          padding: EdgeInsets.zero,
          itemBuilder: (_) {
            return dropdownList().map((item) {
              return PopupMenuItem(
                child: item,
                value: item.title,
              );
            }).toList();
          },
          initialValue: initValue,
          onSelected: (value) {
            setState(() => initValue = value);
          },
          child: SizedBox(
            width: 230,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              leading: userPhoto(),
              title: Text(
                'Brandon Calm',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: widget.bgColor == Color(0xFFF3F3F3)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              subtitle: Text(
                'Owner Detocen',
                style: TextStyle(fontSize: 12, color: Color(0xFF858585)),
              ),
            ),
          ),
          offset: Offset(0, 120),
        ),
      ],
    );
  }

  List<ListTile> dropdownList() {
    return [
      ListTile(
        leading: Icon(Icons.account_box),
        title: Text('Profile'),
        trailing: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xFFF6B16C),
            shape: BoxShape.circle,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Notification'),
        trailing: notif(),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Logout'),
        onTap: () {},
      ),
    ];
  }

  Widget userPhoto({String imageUrl}) {
    return Container(
      width: 42,
      height: 42,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Color(0xFFA5668B)),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageUrl ?? 'assets/person.jpg'),
      ),
    );
  }

  Widget notif() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFFF6B16C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '2',
        style: TextStyle(fontSize: 10, color: Color(0xFFEEEEEE)),
      ),
    );
  }
}
