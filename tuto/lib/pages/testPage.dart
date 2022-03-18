import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  int _count = 1;

  _clickBTN(){ 


    setState(() {
      _count = _count + 1;
    }); 
    
    print('count value : $_count');

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(' $_count click count '),

          FlatButton(
            onPressed: (){
              _clickBTN();
            } ,
            child: Text('Click me'),
          )
        ],
      ),
      ),
    );
  }
}