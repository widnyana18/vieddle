import 'package:flutter/material.dart';
import 'package:vieddle/interface/util/utils.dart';

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.6,
            child: Container(color: Colors.grey[50]),
          ),
          SizedBox(height: 18),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Animals Under The Bed',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'met consectetur adipisicing elit. Exercitationem tempore impedit autem consectetur qui'
                  'am met consectetur adipisicing elit. Exercitationem tempor you interest, check details to get.',
                ),
              ],
            ),
          ),
        ],
      ),
      smallScreen: AspectRatio(
        aspectRatio: 1.6,
        child: Container(color: Colors.grey[50]),
      ),
    );
  }
}
