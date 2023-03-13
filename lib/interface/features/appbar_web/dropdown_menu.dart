import 'package:flutter/material.dart';

class CatalogMenu extends StatefulWidget {
  @override
  _CatalogMenuState createState() => _CatalogMenuState();
}

class _CatalogMenuState extends State<CatalogMenu> {
  dynamic newValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return dropdownList().map((item) {
          return PopupMenuItem(
            child: Text(item.title),
            value: item.title,
            enabled: true,
          );
        }).toList();
      },
      initialValue: newValue,
      onSelected: (value) {
        setState(() => newValue = value);
      },
      child: Row(
        children: [
          Text(
            'Shopping',
            style: TextStyle(color: Color(0xFFF5F5F5), fontSize: 14),
          ),
          Icon(Icons.keyboard_arrow_down, color: Color(0xFFF5F5F5)),
        ],
      ),
      offset: Offset(0, 120),
    );
  }

  List<CatalogMenuItem> dropdownList() {
    return [
      CatalogMenuItem('Chart', onTap: () {}),
      CatalogMenuItem('Catagory', onTap: () {}),
      CatalogMenuItem('Celebrity', onTap: () {}),
      CatalogMenuItem('Collection', onTap: () {}),
      CatalogMenuItem('Company', onTap: () {}),
      CatalogMenuItem('Explore', onTap: () {}),
    ];
  }
}

class CatalogMenuItem {
  CatalogMenuItem(this.title, {this.onTap});

  final String title;
  final VoidCallback onTap;
}

//     return DropdownButtonHideUnderline(
//       child: DropdownButton(        
//         items: dropdownList().map((item) {
//           return CatalogDropdownMenuItem(            
//             child:  Text(item.title,),
//             value: item.title,            
//           );
//         }).toList(),
//          selectedItemBuilder: (BuildContext context) {
//           return dropdownList().map<Widget>((item) {
//             return Text(item.title, style: TextStyle(color: Color(0xFFF5F5F5)),);
//           }).toList();
//         },
//         onChanged: (value) {
//           setState(() => newValue = value);  
          
//           if(newValue == dropdownList()[1].title){
//             print('good job Magician');
//             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage()));
//           }
//         },
//         icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFFF5F5F5)),
//         hint: Text('Cosmetic', style: TextStyle(color: Color(0xFFF5F5F5)),),
//         value: newValue,
//         isDense: true,
//       ),
//     );
