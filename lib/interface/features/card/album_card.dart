import 'package:flutter/material.dart';
import 'package:vieddle/interface/features/button.dart';

class AlbumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: AssetImage('assets/perfume3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TagButton(
              label: 'HOT',
              color: Color(0xFFF66C6C),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/person.jpg'),
                ),
                title: Text(
                  'Best Perfume for Man',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Roxy Monrow',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF858585),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF858585),
                        radius: 2,
                      ),
                    ),
                    Text(
                      '486',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF858585),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF858585),
                        radius: 2,
                      ),
                    ),
                    Text(
                      '2 months',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF858585),
                      ),
                    ),
                  ],
                ),
                trailing: PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                  ),
                  itemBuilder: (_) {
                    return menuList.map((item) {
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
                ),
                dense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> menuList = ['Bookmark', 'Share'];
  List<String> crudEventItem = ['Share', 'Add Content', 'Edit', 'Delete'];
}
