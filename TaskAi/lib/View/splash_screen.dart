
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:taskai/View/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()
        )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#FFFFFF"),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor("#FFFFFF"),
              statusBarIconBrightness: Brightness.dark),
        ),
        backgroundColor: HexColor("#FFFFFF"),
        body: Center(
          child: Text("FlutterImage",style:
          TextStyle(fontSize: 18,color: HexColor("#F54768"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold)),
        )
    );
  }
}

