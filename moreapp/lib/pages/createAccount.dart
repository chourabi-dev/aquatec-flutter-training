import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moreapp/pages/homePage.dart';




class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {


  
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _fullname = new TextEditingController();
  
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  
 

  
  
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
              controller: _fullname,
            ),
            TextField(
              controller: _email,
            ),
            TextField(
              controller: _password,
            ),
            FlatButton(
              child: Text('create account'),

              onPressed: () {

                _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text).then((value){
                    _db.collection('users').add({
                      'createdAt': new DateTime.now(),
                      'fullname':_fullname.text,
                      'email':_email.text,
                      'uid':value.user.uid
                    }).then((value){
                      Navigator.push(context, new MaterialPageRoute(builder: (ctx)=>HomePage()));
                    });

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