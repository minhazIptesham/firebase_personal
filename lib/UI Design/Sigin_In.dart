import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_personal/UI%20Design/xxx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BottomNav.dart';

class Crud_Firebase extends StatefulWidget {
  const Crud_Firebase({Key? key}) : super(key: key);

  @override
  _Crud_FirebaseState createState() => _Crud_FirebaseState();
}

class _Crud_FirebaseState extends State<Crud_Firebase> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      // print("completed");
      setState(() {});
    });
  }

  create() async {
    try {
      await firebase
          .collection("User Address")
          .doc(Email.text)
          .set({"Email": Email.text, "Password": Password.text});
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("User Address").doc(Email.text).update({'Password': Password.text});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Sign In",style: TextStyle(fontSize: size.width*.06,color: Colors.black45),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: size.width*0.11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),
                  ),
                  SizedBox(height:size.height*.03,),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: Email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon:
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 1, 10, 1),
                                child: SvgPicture.asset(
                                    "asset/image/Mail.svg")),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: Colors.black54),
                              gapPadding: 8,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: Colors.black54),
                              gapPadding: 10,
                            ),
                          ),
                        ),
                        SizedBox(height:size.height*.03,),
                        TextFormField(
                          obscureText: true,
                          controller: Password,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon:
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 1, 10, 1),
                                child: SvgPicture.asset(
                                    "asset/image/Lock.svg")),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: Colors.black54),
                              gapPadding: 8,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide(color: Colors.black54),
                              gapPadding: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height*.03,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height*.08,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20) ),
                        primary: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: (){
                        create();
                        dispose();
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => BottomNavBar()));
                      },
                      child: Text("Continue"),
                    ),
                  ),
                  SizedBox(
                    height: size.height*.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width*.02),
                          padding: EdgeInsets.all(size.width*.04),
                          height: size.height*.06,
                          width: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("asset/image/google-icon.svg"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width*.02),
                          padding: EdgeInsets.all(size.width*.04),
                          height: size.height*.06,
                          width: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("asset/image/facebook-2.svg"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width*.02),
                          padding: EdgeInsets.all(size.width*.04),
                          height: size.height*.06,
                          width: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("asset/image/instagram-svgrepo-com.svg"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width*.02),
                          padding: EdgeInsets.all(size.width*.04),
                          height: size.height*.06,
                          width: size.height*.06,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("asset/image/twitter.svg"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
