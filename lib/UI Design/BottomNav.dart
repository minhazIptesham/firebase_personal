import 'package:flutter/material.dart';

import 'Account.dart';
import 'HomePage.dart';
import 'Messege&Notify.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index=0;
  final pages=[
    home_page(),
    message(),
    message(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black45,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black45,),
                label: "Home"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message_sharp,color: Colors.black45,),
                label: "Messages"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.black45,),
                label: "Cart"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black45,),
                label: "Account"
            ),


          ],
          onTap: (value){
            setState(() {
              index=value;
            });
          },

        ),
        body: pages[index],
      ),
    );
  }
}
