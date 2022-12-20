import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class message extends StatefulWidget {
  const message({Key? key}) : super(key: key);

  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 1,
          title: Text("Suxbatlar",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,size: 30,))
          ],
        ),
        Container(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('asset/image/panjabi001.jpg'),
            ),
            title: Text('Minhaz'),
            subtitle: Text('Thank you! That was very helpful!'),
          ),
        ),
        Divider(),
        Divider(),
        Container(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('asset/image/Product-Image-1656144704.jpg'),
            ),
            title: Text('MST. BITHI KHATUN'),
            subtitle: Text('Thank you! I really like to do shopping here!'),
          ),
        ),

        Divider(),
        Divider(),
        Container(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('asset/image/Product-Image-1655109296.jpg'),
            ),
            title: Text('Shohag'),
            subtitle: Text('Thank you! That was very helpful!'),
          ),
        ),
        Divider(),
        Divider(),
        Container(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('asset/image/Product-Image-1655961892.jpg'),
            ),
            title: Text('James'),
            subtitle: Text('Thank you! That was very helpful!'),
          ),
        ),
      ],
    );
  }
}
