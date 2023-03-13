import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({this.usePopupMenu = true, this.popupData, this.otherAction});
  final bool usePopupMenu;
  final List<String> popupData;
  final Widget otherAction;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [searchBar(size), actionBtn(), otherAction],
    );
  }

  Widget searchBar(Size size) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      height: 40,
      width: 460,
      constraints: BoxConstraints(maxWidth: size.width * .7),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15),
          hintText: 'Search Product !!',
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget actionBtn() {
    if (usePopupMenu) {
      return PopupMenuButton(
        icon: Icon(
          Icons.equalizer,
          color: Color(0xFF858585),
        ),
        itemBuilder: (_) {
          return popupData.map((item) {
            return PopupMenuItem(
              child: Text(
                item,
                style: TextStyle(color: Color(0xFF858585)),
              ),
              value: item,
            );
          }).toList();
        },
        // initialValue: initValue,
        onSelected: (value) {},
        offset: Offset(0, 120),
      );
    }
    return ButtonTheme(
      minWidth: 40,
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.zero,
        child: Icon(Icons.equalizer),
        onPressed: () {},
        color: Colors.white,
      ),
    );
  }
}
