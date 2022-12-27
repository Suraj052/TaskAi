import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:taskai/Provider/provider.dart';


class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: HexColor("#F54768"),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor("#F54768"),
              statusBarIconBrightness: Brightness.light),
          centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back_ios_new,color: HexColor("#FFFFFF"),size: 25),onPressed: () => Navigator.pop(context)),
          title: Text("ImageScreen",style:
          TextStyle(fontSize: 18,color: HexColor("#ffffff"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold)),
      ),
      body: Consumer<ImagProvider>
        (
          builder: (context,value,child)
          {
            if(value.isLoading)
            {
              return Center(child: CircularProgressIndicator(color: HexColor("#2E424D")));
            }
            File? imagetaken = value.image;
            return (imagetaken==null) ?
            Center(
              child: Text(
                'First select an image from gallery !',
                style: TextStyle(fontSize: 17,color: HexColor("#25262D"),fontWeight: FontWeight.w600),
              ),
            ):
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Text("Before",style:
                            TextStyle(fontSize: 18,color: HexColor("#25262d"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height*0.02),
                      Image.file(
                      imagetaken,
                      width: size.width*0.95,
                      height: size.height*0.5,
                      fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(width: size.width*0.05),
                  Column(
                    children: [
                      Text("After",style:
                      TextStyle(fontSize: 18,color: HexColor("#25262d"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height*0.02),
                      ColorFiltered(
                          colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
                          child: Image.file(
                            imagetaken,
                            width: size.width*0.95,
                            height: size.height*0.5,
                            fit: BoxFit.contain,
                          ),
                      ),
                    ],
                  )
                ]
              ),
            );
          }
      ),
    );
  }
}
