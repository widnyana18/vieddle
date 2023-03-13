import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EditProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: 'Username',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'xxx@example.com',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: 'New Password',
              helperText: 'Contain font, numeric, symbol, and min length 8',
              helperMaxLines: 2,
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              DropdownButton(
                items: countryNumber
                    .map((item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ))
                    .toList(),
                onChanged: (val) {},
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 16,
                value: countryNumber[0],
                itemHeight: 30,
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          DropdownButton(
            items: countryNumber
                .map((item) => DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    ))
                .toList(),
            onChanged: (val) {},
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 16,
            value: countryNumber[0],
            itemHeight: 30,
          ),
          SizedBox(height: 18),
          RaisedButton(
            child: Text('Save Profile'),
            onPressed: () {},
            color: Color(0xFFE36789),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  List<String> countryNumber = ['+62', '+21'];
  List<String> status = [
    'Job Desk',
    'Student',
    'Employe',
    'Directur',
    'Marketing',
    'Manajer',
    'Accounting',
    'Enterpreneur',
    'Bussiness'
  ];
}

class CreditCardForm extends StatelessWidget {
  static Widget creditFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Credit Name',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 25),
            Flexible(
              flex: 2,
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Bank Name',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Credit Number',
            hintText: 'XXXXXXXXXXXX',
            suffix: Row(
              children: [
                Icon(FlutterIcons.cc_visa_faw, size: 16),
                Icon(FlutterIcons.cc_mastercard_faw, size: 16),
              ],
            ),
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'MM/YY',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 30),
            Flexible(
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'CVV',
                  hintText: 'DDDD',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          creditFormField(),
          SizedBox(height: 18),
          RaisedButton(
            child: Text('Assign Credit'),
            onPressed: () {},
            color: Color(0xFFE36789),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ]
      ),
    );
  }
}
