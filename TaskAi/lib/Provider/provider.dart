
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ImagProvider extends ChangeNotifier
{
  File? image;
  File? image2;
  bool isLoading = false;

  Future<void> pfun() async
  {

    isLoading = true;
    notifyListeners();

    try{
      final imagee = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(imagee==null) return;

      final imageTemp = File(imagee.path);
      image = imageTemp;

    }on PlatformException catch(e)
    {
      showToast(" Something went wrong ! ");
      print(e.message);
    }

    isLoading = false;
    notifyListeners();

  }
}

void showToast(String text) => Fluttertoast.showToast
  (
  msg: text,
  fontSize: 13.0,
  backgroundColor: HexColor("#fed701"),
  textColor: Colors.black,
  gravity: ToastGravity.BOTTOM,
);