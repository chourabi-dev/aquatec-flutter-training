import 'package:advanced/tabs/HomeTab.dart';
import 'package:advanced/tabs/ProfileTab.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _index = 0;


  List<Widget> _tabs = [
    HomeTab(),
    ProfileTab()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),

              child: Container(
                padding: EdgeInsets.all(16),
                width: 2000,
                color: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    Container(height: 15,),
                    Text('chourabi taher'),
                    Text('tchourabi@gmail.com'),
                    
                  ],
                ),
              ),
            ),

            ListTile(
              title: Text('My products'),
              subtitle: Text('18 products'),
              onTap: (){

              },
            ),
            ListTile(
              title: Text('My products'),
              subtitle: Text('18 products'),
              onTap: (){

              },
            ),
            




          ],
        ),
      ),


      body: _tabs.elementAt(_index),

     

      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.ac_unit)
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.account_circle)
          ),
          
        ],
      ),
    );
  }
}