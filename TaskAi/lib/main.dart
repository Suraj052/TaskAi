import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskai/Provider/provider.dart';
import 'package:taskai/View/splash_screen.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
        create:(context) =>ImagProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      );
}
