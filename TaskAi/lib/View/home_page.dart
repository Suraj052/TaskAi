
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:provider/provider.dart';
import 'package:taskai/Provider/provider.dart';
import 'package:taskai/View/image_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ImagProvider>(context);

    return Scaffold(
      backgroundColor: HexColor("#EAEBED"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#F54768"),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("#F54768"),
            statusBarIconBrightness: Brightness.light),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>ImageScreen())),
              icon: Icon(Icons.image,color: HexColor("#ffffff"),size: 24))
        ],
        title: Text("FlutterImage",style:
        TextStyle(fontSize: 18,color: HexColor("#ffffff"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: size.height*0.50,
            width: size.width*0.95,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image:  AssetImage('assets/bird.png')
              ),
            ),
          ),
          SizedBox(height: size.height*0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:HexColor("#F54768"),
              minimumSize: const Size(350, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: ()=> provider.pfun(),
            child: Text("Select an image from gallery",
                 style: TextStyle(color: HexColor("#FFFFFF"))),
          )

        ],
      ),
    );
  }
}

void showToast(String text) => Fluttertoast.showToast
  (
  msg: text,
  fontSize: 13.0,
  backgroundColor: HexColor("#F54768"),
  textColor: Colors.white,
  gravity: ToastGravity.BOTTOM,
);