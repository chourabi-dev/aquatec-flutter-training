import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
          body: Container(
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

      )
    );
    
  }
}


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