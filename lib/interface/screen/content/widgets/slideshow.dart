import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class SlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isLarge = ResponsiveLayout.isLargeScreen(context);

    return CarouselSlider.builder(
      itemCount: carouselItem(context).length,
      carouselController: ScrollController(),
      itemBuilder: (_, idx) {
        return GestureDetector(
          onTap: carouselItem(context)[idx].onTap,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                carouselItem(context)[idx].image,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF532640).withOpacity(.2),
                      Color(0xFF532640)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SizedBox(
                width: isLarge ? size.width * .5 : size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      carouselItem(context)[idx].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontSize: isLarge ? 50 : 20,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      carouselItem(context)[idx].subTitle,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        // height: isLarge ? size.height * .8 : size.height * .42,
        autoPlay: true,
      ),
    );
  }

  List<CarouselItem> carouselItem(BuildContext context) {
    return [
      CarouselItem(
        'Best Collection',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Exer autem consectetur qui amet.',
        image: 'assets/perfume9.jpg',
        onTap: () {},
      ),
      CarouselItem(
        'Big Sell',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Exer autem consectetur qui amet.',
        image: 'assets/perfume17.jpg',
        onTap: () {},
      ),
      CarouselItem(
        'Young Beauty',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Exer autem consectetur qui amet.',
        image: 'assets/lake.jpg',
        onTap: () {},
      ),
    ];
  }
}

class CarouselItem {
  CarouselItem(this.title, {this.subTitle, this.image, this.onTap});

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
}
