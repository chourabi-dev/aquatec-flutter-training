import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {


  
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  
  FirebaseAuth _auth = FirebaseAuth.instance;
 

  _checkIfAuth(){
    //_auth.currentUser
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
            ),
            TextField(
              controller: _password,
            ),
            FlatButton(
              child: Text('connect'),

              onPressed: () {

                _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text).then((value){
                    print(value);
                }).catchError((onError){
                  print(onError);
                });
              },
            )
          ],
        ),
      )
    );
  }
}