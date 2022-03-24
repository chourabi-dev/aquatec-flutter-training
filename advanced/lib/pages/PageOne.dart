import 'package:advanced/pages/pageTwo.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){
              // naviagtaion
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return PageTwo( message: 'hello from page one', );
              },) ); 
            },
          )
        ],
      ),
      body: Center(
        child: Text('Welcome to our app'),
      ),
    );
  }
}