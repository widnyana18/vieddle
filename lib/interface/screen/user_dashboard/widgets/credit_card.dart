import 'dart:ui';

import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  Widget addCardBtn() {
    return OutlineButton.icon(
      icon: Icon(
        Icons.credit_card,
        color: Color(0xFF858585),
        size: 18,
      ),
      label: Text('Add Card'),
      borderSide: BorderSide(color: Color(0xFF858585)),
      onPressed: () {},
      shape: StadiumBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        addCardBtn(),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF422163), Color(0xFFC84C6E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(
                'BCA',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFE8E8E8),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 15),
              Text(
                'John Cena Jr',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE8E8E8),
                ),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  readOnly: true,
                  initialValue: 'ga082jkl23mn8hklsfljq0jlaxavfa2t',
                  obscureText: true,
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabled: false,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  style: TextStyle(color: Color(0xFFE8E8E8)),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                      Text(
                        'ZAHB1',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE8E8E8),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '22/444',
                    style: TextStyle(
                      color: Color(0xFFE8E8E8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
