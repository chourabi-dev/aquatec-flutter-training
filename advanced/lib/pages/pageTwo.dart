import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {

  final String message;
 

  PageTwo({Key key, this.message}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.message),
      ),

      body: Center(
        child: FlatButton(
          child: Text('Back to hoem page'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}