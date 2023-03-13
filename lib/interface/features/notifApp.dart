import 'dart:ui';
import 'package:flutter/material.dart';

class NotifApp extends StatelessWidget {
  const NotifApp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Notification',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway',
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx, idx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(notifData[idx].photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            notifData[idx].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notifData[idx].user,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF858585),
                                ),
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xFF858585),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                '2 weeks ago',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF858585),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            notifData[idx].desc,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (ctx, idx) => Divider(),
              itemCount: notifData.length,
            ),
          ),
        ],
      ),
    );
  }

  List<Feature> get notifData => [
        Feature(
          'Roxy Morrow FT',
          user: 'Daniel Sirckrow',
          desc:
              'tempore impedit autem consectetur qui amet Exercitationem tempore.... ',
          photo: 'assets/leaf.jpg',
        )
      ];
}

class Feature {
  Feature(this.title, {this.user, this.desc, this.photo});

  final String title;
  final String user;
  final String desc;
  final String photo;
}
