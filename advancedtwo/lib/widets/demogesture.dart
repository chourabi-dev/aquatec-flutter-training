import 'package:flutter/material.dart';

class DemoGesture extends StatefulWidget {
  DemoGesture({Key key}) : super(key: key);

  @override
  State<DemoGesture> createState() => _DemoGestureState();
}

class _DemoGestureState extends State<DemoGesture> {

  double _width = 100;
  Color _color = Colors.orange;
  
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    return  GestureDetector(
          
          onHorizontalDragStart: (info){
            setState(() {
              _color = Colors.green;
            });
          },
          onHorizontalDragUpdate: ( DragUpdateDetails  info){
            print(info.globalPosition.dx);
            setState(() {
              if ( ( info.globalPosition.dx >= 100 ) && ( info.globalPosition.dx < ( w * 0.8 ) ) ) {
                _width = info.globalPosition.dx;
              }
              
            });
          },

          onHorizontalDragEnd: (DragEndDetails info){
            setState(() {
              _width = 100;
              _color = Colors.orange;
            });
          },
          child: Container(
          width: _width,
          color: _color,
          margin: EdgeInsets.only(bottom: 15),
          height: 100,
          
        ),
    );
  }
}




/**
 * new GestureDetector(
          onDoubleTap: (){
             setState(() {
               _color = Colors.orange;
             });
          },
          child: Container(
          margin: EdgeInsets.only(bottom: 15),
          height: 100,
          color: _color,
        ),
        );
 */