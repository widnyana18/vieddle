import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  LoginButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFf0E103D), Color(0xFFA5668B)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.transparent,
        child: Text(text, style: TextStyle(color: Colors.white)),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
      ),
    );
  }
}

class TagButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  TagButton({this.label, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 22,
      minWidth: 40,
      child: FlatButton(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onTap,
        color: color,
      ),
    );
  }
}

class FloatingBtn extends StatelessWidget {
  FloatingBtn({
    this.icon,
    this.onTap,
    this.label,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 3,
          right: 3,
          child: FloatingActionButton(
            onPressed: onTap,
            backgroundColor: Color(0xFFF6B16C),
            child: Icon(
              icon,
              color: Color(0xFFEEEEEE),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
            decoration: BoxDecoration(
              color: Color(0xFFF6DA6C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
