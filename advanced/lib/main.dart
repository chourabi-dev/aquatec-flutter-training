import 'package:advanced/pages/HomePage.dart';
import 'package:advanced/pages/HomeTodo.dart';
import 'package:advanced/pages/PageOne.dart';
import 'package:advanced/pages/alerts.dart';
import 'package:advanced/pages/app.dart';
import 'package:advanced/pages/whatsapp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Brightness _appBrightness = Brightness.light;


  _switchToDark(){
    setState(() {
      _appBrightness = _appBrightness == Brightness.light ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: _appBrightness,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,

        // AppPage( themeChangeFN: _switchToDark, )
        child: HomeTodoPage(),
      ),
    );
  }
}
