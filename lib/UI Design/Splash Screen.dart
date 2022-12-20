import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Sigin_In.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset("asset/image/37260-ecommerce-blue.gif"),
            SizedBox(height: 20,),
            Text("E-Shopping",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black),),
            Text("Powerd by Minhaz",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.black87),)
          ],
        ),
        backgroundColor: Colors.white,
        splashIconSize: 500,
        duration: 3000,
        animationDuration: Duration(seconds: 1),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Crud_Firebase(),
    );
  }
}
