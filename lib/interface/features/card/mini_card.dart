import 'package:flutter/material.dart';

class ContentMiniCard extends StatelessWidget {
  // ContentMiniCard({this.product});

  // final ProductTileData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {},
        child: Ink(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/snorkeling.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Deu Las Perfume Morina  Lupina',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Daniel Conte Sana',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: CircleAvatar(
                            radius: 2,
                            backgroundColor: Color(0xFF858585),
                          ),
                        ),
                        Text(
                          '456',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: CircleAvatar(
                            radius: 2,
                            backgroundColor: Color(0xFF858585),
                          ),
                        ),
                        Text(
                          '2w',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTileData {
  ProductTileData({
    this.hero,
    this.prodName,
    this.company,
    this.rate,
    this.price,
    this.onTap,
    this.colors,
  });

  final String hero;
  final String prodName;
  final String company;
  final double rate;
  final int price;
  final List<int> colors;
  final VoidCallback onTap;
}
