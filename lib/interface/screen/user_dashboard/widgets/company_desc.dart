import 'package:flutter/material.dart';

class CompanyDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paramecium D. Reiss',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Id : gh-214hkh2909fhaojas9214',
            style: TextStyle(color: Color(0xFF858585)),
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.person,
                size: 15,
                color: Color(0xFFE36789),
              ),
              SizedBox(width: 8),
              Text(
                'Distributor',
                style: TextStyle(
                  color: Color(0xFFE36789),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 15,
              ),
              SizedBox(width: 8),
              Text(
                'Los Angels, USA',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Any product we can prevent and you can build your shop free. If you interest, check details to get'
            'more information. Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem tempore'
            'impedit autem consectetur qui amet Exercitationem tempore impedit autem',
          ),
          SizedBox(height: 8),
          Wrap(
            children: List.generate(
              tagCompany.length,
              (idx) => InkWell(
                onTap: tagCompany[idx].onTap,
                child: Text(
                  '#${tagCompany[idx].title}',
                  style: TextStyle(color: Color(0xFF8174F2)),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '09/18/2018',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  List<TagCompany> tagCompany = [
    TagCompany('New', onTap: () {}),
    TagCompany('Rare', onTap: () {}),
    TagCompany('Special', onTap: () {}),
    TagCompany('Cheap', onTap: () {}),
  ];
}

class TagCompany {
  TagCompany(this.title, {this.onTap});

  final String title;
  final VoidCallback onTap;
}
