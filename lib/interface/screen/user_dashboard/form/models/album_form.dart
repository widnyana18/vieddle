import 'package:flutter/material.dart';

import 'package:vieddle/interface/util/sliver_header_delegate.dart';

class AlbumForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        labelText: 'Album Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    sliver: SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        child: TabBar(
                          indicatorColor: Color(0xFFE36789),
                          unselectedLabelColor: Color(0xFF858585),
                          labelColor: Color(0xFFE36789),
                          tabs: [
                            Tab(text: 'Article'),
                            Tab(text: 'Video'),
                            Tab(text: 'Model'),
                          ],
                          onTap: (idx) {},
                        ),
                        minHeight: 30,
                        maxHeight: 30,
                      ),
                      pinned: true,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (ctx, idx) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/fox-book.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            title: Text(
                              'Deu Las Perfume Morina Lupina',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  '787 views',
                                  style: TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Color(0xFF858585),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '20.20',
                                  style: TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.check_circle_outline),
                              onPressed: () {},
                              color: Color(0xFF858585),
                            ),
                            dense: true,
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          RaisedButton(
            child: Text('Create Album'),
            onPressed: () {},
            color: Color(0xFFE36789),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
