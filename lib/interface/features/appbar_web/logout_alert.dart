import 'package:flutter/material.dart';

class LogOutAlert extends StatelessWidget {
  final String username;
  LogOutAlert({this.username});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('John Cena'),
      titlePadding: EdgeInsets.all(15),
      titleTextStyle:
          TextStyle(color: Color(0xFFE76781), fontSize: 18, fontFamily: 'Montserrat'),
      content: Text(
          'Your Account Had Been Log Out, Please Logged In If You Comeback Again'),
      backgroundColor: Colors.white,
      elevation: 8,
    );
  }
}
