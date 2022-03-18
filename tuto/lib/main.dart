import 'package:flutter/material.dart';
import 'package:tuto/pages/chat.dart';
import 'package:tuto/pages/chats.dart';
import 'package:tuto/pages/e-book.dart';
import 'package:tuto/pages/testPage.dart';
import 'package:tuto/widgets/newsFeed.dart';
import 'package:tuto/widgets/userCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageReader(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  List _newsFeed = [1,2,3,5,6 ];

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
          body: /*ListView.builder( itemCount: _newsFeed.length, itemBuilder: (context, index) {
             // return NewsFeed( comments: 19 , likes: 20,);
              return ;
          }, )*/

          ListView(
            children: [ 
              UserCard( 
                username: "Chourabi taher", 
                email: "tchourabi@gmail.com", 
                connected: true, ),
                UserCard( 
                username: "Chourabi taher", 
                email: "tchourabi@gmail.com", 
                connected: false, ),
                
            ],

          )

      )
    );
    
  }
}



/**
 * Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center ,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 
                children: [
                   Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  ,
                   Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  
                  ,
                   Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  
                  
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center , 
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 
                children: [
                   Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  ,
                  
                  Container(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                       Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  
                  ,
                   Container(
                     height: 50,
                     width: 50,
                     color: Colors.amberAccent,
                   )
                  
                    ],),
                  )
                  
                ],
              ),

              
            ],
          ),
          )
 */


/**
 * SingleChildScrollView(
            child: Container(
             
             width: MediaQuery.of(context).size.width,
             //height: MediaQuery.of(context).size.height,

            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('hello world'),
            Text('hello world'), 
            
            
          ],),
          ),
          ),
 */