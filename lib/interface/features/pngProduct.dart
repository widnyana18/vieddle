import 'dart:ui';

import 'package:flutter/material.dart';

class PngProduct extends StatelessWidget {
  final String imageSrc;
  PngProduct({@required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          left: -2,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Image.asset(
              imageSrc,
              fit: BoxFit.contain,
              color: Colors.black45,
            ),
          ),
        ),
        Image.asset(
          imageSrc,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
