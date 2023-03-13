import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({this.color});
  final Color color;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color get getColor => widget.color == Colors.black ? Color(0xFFA74D76) : Color(0xFFEEEEEE);

  List<Widget> navItems(context) => [
        AppLogo(bgColor: getColor),
        FlatButton(
          child: Text(
            'Catalog',
            style: TextStyle(color: widget.color),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/catalog');
          },
        ),
        FlatButton(
          child: Text(
            'Fashion',
            style: TextStyle(color: widget.color),
          ),
          onPressed: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: navItems(context).map((item) => item).toList(),
    );
  }
}

class AppLogo extends StatelessWidget {
  final Color bgColor;

  AppLogo({this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          'M',
          style: TextStyle(
            color: bgColor == Color(0xFFEEEEEE)
                ? Color(0xFF82415F)
                : Color(0xFFEEEEEE),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

