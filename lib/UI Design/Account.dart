import 'package:flutter/material.dart';

import 'Messege&Notify.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(color: Colors.black54),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Profile pic
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
               // overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("asset/image/user.png"),
                  ),
                  Positioned(
                    right: -12,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white)),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Profile Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFEEEEEE),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "My Account",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFEEEEEE),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "Notifications",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFEEEEEE),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "Setting",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFEEEEEE),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "Help Center",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFFEEEEEE),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "Log Out",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
