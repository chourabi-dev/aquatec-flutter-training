
import 'package:advancedtwo/widets/demogesture.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key); 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      /**
       * body: ListView.builder(itemCount: 10, itemBuilder: (context, index) {
        return DemoGesture();
        
        



      },)
       */



      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DemoGesture(),
          DemoGesture(),
          DemoGesture(),
          
        ],
      ),
    );
  }
}