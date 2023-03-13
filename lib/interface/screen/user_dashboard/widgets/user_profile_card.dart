import 'package:flutter/material.dart';

List<UserQuantity> quantList = [
  UserQuantity(
    atribute: 'Customers',
    count: '120',
  ),
  UserQuantity(
    atribute: 'Subscriptions',
    count: '5',
  ),
  UserQuantity(
    atribute: 'Products',
    count: '231',
  ),
  UserQuantity(
    atribute: 'Sold',
    count: '180',
  ),
  UserQuantity(
    atribute: 'Income',
    count: '\$45M',
  ),
];

class UserProfileCard extends StatelessWidget {
  UserProfileCard({this.showAllDesc});
  final bool showAllDesc;

  static Widget regular() {
    List<UserQuantity> regularQuantList = quantList..removeAt(2);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('assets/person.jpg'),
            radius: 60,
            child: Align(
              alignment: Alignment(.8, .8),
              child: CircleAvatar(
                radius: 10,
                child: Icon(
                  Icons.verified_user,
                  size: 12,
                  color: Color(0xFFDFDFDF),
                ),
                backgroundColor: Color(0xFF8174F2),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Roland Camel',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Owner Paramecium',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Column(
            children: regularQuantList
                .map(
                  (item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.atribute,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        item.count,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: Image.asset(
                'assets/perfume9.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: AspectRatio(
                aspectRatio: 1.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: CircleAvatar(
                            backgroundColor: Colors.white60,
                            radius: 3,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage('assets/person.jpg'),
                      radius: 60,
                      child: Align(
                        alignment: Alignment(1, 1),
                        child: CircleAvatar(
                          child: Icon(
                            Icons.verified_user,
                            size: 16,
                            color: Color(0xFFDFDFDF),
                          ),
                          backgroundColor: Color(0xFF8174F2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Roland Camel',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Owner Paramecium',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 12, 20, 18),
          child: Column(
            children: ownerQuantList()
                .map(
                  (item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.atribute,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        item.count,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  List<UserQuantity> ownerQuantList() {
    if (!showAllDesc) {
      return quantList..removeAt(3);
    }

    return quantList;
  }
}

class UserQuantity {
  UserQuantity({this.atribute, this.count});

  final String atribute;
  final String count;
}


