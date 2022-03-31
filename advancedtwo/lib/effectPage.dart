import 'dart:async';

import 'package:flutter/material.dart';

class EffectPage extends StatefulWidget {
  EffectPage({Key key}) : super(key: key);

  @override
  State<EffectPage> createState() => _EffectPageState();
}

class _EffectPageState extends State<EffectPage> {

  double _opacity = 0;
  
  double _w = 50;
  double _h = 50;

  bool _opened = false;
  

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: (){
            setState(() {
              _w = MediaQuery.of(context).size.width;
              _h = MediaQuery.of(context).size.height;
              
            });
            // delay

            Timer timer = new Timer(Duration(milliseconds: 1520), (){
              setState(() {
                //_opened = true;
                _opacity = 1;
              });
            });


          },
          child: AnimatedContainer(
            duration: Duration( milliseconds: 1500 ),
            curve: Curves.easeIn,
            height: _h,
            width: _w,
            color: Colors.orange,
            child:  AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 500),
              child: Center(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ) ,),
          ),
        ),
      ),
    );
  }
}



/***
 * 
 *  AnimatedOpacity(
            curve:  Curves.linear,
            duration: Duration(milliseconds: 500),
          opacity: _opacity,
          child: Container(
          height: 250,
          width: 250,
          color: Colors.pink,
        ),
        )
 */