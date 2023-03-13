import 'package:flutter/material.dart';

class ArticlePaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Animals Under The Bed',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('assets/perfume9.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          'met consectetur adipisicing elit. Exercitationem tempore impedit autem consectetur qui'
          'am met consectetur adipisicing elit. Exercitationem tempor you interest, check details to get'
          'more information.  you interest, check details to get more  you interest, check details to get'
          'more ctetur adipisicing elit. Exercitationem tempor you interest, check details to get mo'
          'met consectetur adipisicing elit. Exercitationem tempore impedit autem consectetur qui'
          'am met consectetur adipisicing elit. Exercitationem tempor you interest, check details to'
          'get more information.  you interest, check details to get more  you',
        ),
      ],
    );
  }
}
