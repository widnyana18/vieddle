import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPhoto extends StatelessWidget {
  static Widget slideshow() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (ctx, idx) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/perfume9.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          options: CarouselOptions(
            aspectRatio: .9,
            enlargeCenterPage: true,            
          ),
        ),
        Positioned(
          bottom: 8,
          child: Row(
            children: List.generate(
              3,
              (idx) => Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
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
          Row(
            children: [
              Flexible(
                flex: 2,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemBuilder: (ctx, idx) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage('assets/${assetImg[idx]}.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (idx) =>
                      StaggeredTile.fit(math.Random().nextInt(4)),
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: 8,
                ),
              ),
              SizedBox(width: 18),
              Flexible(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/perfume9.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.black54,
                              child: Text(
                                '1/3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'met consectetur adipisicing elit. Exercitationem tempore impedit autem consectetur qui'
                        'am met consectetur adipisicing elit. Exercitationem tempor you interest, check details to get',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> assetImg = [
    'fox-book',
    'perfume3',
    'perfume7',
    'perfume9',
    'person',
    'snorkeling'
  ];
}
