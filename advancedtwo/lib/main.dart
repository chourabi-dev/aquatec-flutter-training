import 'package:advancedtwo/effectPage.dart';
import 'package:advancedtwo/pages/api.dart';
import 'package:advancedtwo/pages/homePage.dart';
import 'package:advancedtwo/pages/picker.dart';
import 'package:advancedtwo/widets/pageHeroOne.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

