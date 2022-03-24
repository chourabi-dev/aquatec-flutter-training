import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home tab'),
      ),

      body: Container(
        child: 
        InkWell(
          onTap: (){

          },
          child: Container(
          height: 500,
          width: 500,
          
          color:Colors.amberAccent
          
        ),
        ),
      ),

      floatingActionButton: FloatingActionButton(),
    );
  }
}