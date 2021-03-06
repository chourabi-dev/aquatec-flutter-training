import 'package:flutter/material.dart';

class PageReader extends StatefulWidget {
  PageReader({Key key}) : super(key: key);

  @override
  State<PageReader> createState() => _PageReaderState();
}

class _PageReaderState extends State<PageReader> {

  bool _darkModeActive = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkModeActive == false ?  Colors.white :  Colors.black ,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_5),

            onPressed: (){
              setState(() {
                _darkModeActive = ! _darkModeActive;
              });
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
         
          padding: EdgeInsets.all(20),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: TextStyle( color: _darkModeActive == true ?  Colors.white :  Colors.black  ),
          ),
        ),
      ),
    );
  }
}