import 'package:flutter/material.dart';

class ContactPersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Chat Box',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Color(0xFF858585),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (ctx, idx) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('asset/person.jpg'),
            ),
            title: Text(
              'Like Mierownoa',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Exercitationem tempore impedit autem consectetur qui amet tempore moarb kadlsasbanu',
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFA5A5A5),
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '3 days ago',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xFFF27496),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '20',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            dense: true,
            isThreeLine: true,
            onTap: () {},
          );
        },
      ),
    );
  }
}

class ChatMsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Sapriadi Ms',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Color(0xFF858585),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
