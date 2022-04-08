import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moreapp/pages/homePage.dart';
import 'package:moreapp/pages/signin.dart';

class CheckAuthStatus extends StatefulWidget{
  CheckAuthStatus({Key key}) : super(key: key);

  @override
  State<CheckAuthStatus> createState() => _CheckAuthStatusState();
}

class _CheckAuthStatusState extends State<CheckAuthStatus> {


    FirebaseAuth _auth = FirebaseAuth.instance;
    User _current = null;

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _current = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:  FlatButton(
            child: Text('Continue'),
            onPressed: (){
              print(_current);

              if( _current == null ){
                Navigator.push(context, new MaterialPageRoute(builder: (ctx)=>SigninPage()));

              }else{
Navigator.push(context, new MaterialPageRoute(builder: (ctx)=>HomePage()));
                
              }
            },
          ),
        ),
      ),
    );
  }
}