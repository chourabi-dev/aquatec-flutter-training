import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateNewStatus extends StatefulWidget {
  CreateNewStatus({Key key}) : super(key: key);

  @override
  State<CreateNewStatus> createState() => _CreateNewStatusState();
}

class _CreateNewStatusState extends State<CreateNewStatus> {

  TextEditingController _note = new TextEditingController();

  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;


  _createNote(){
    String note = _note.text;

    if (note != '') {
      _db.collection('news').add({
          'content': note,
          'createdAt': new DateTime.now(),
          'views':[],
          'user': {
            'uid':_auth.currentUser.uid,
            'email':_auth.currentUser.email,
            
          }
      }).then((value) {
        Navigator.pop(context);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create status'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
        children: [
          TextField(
            controller: _note,
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Say something usefull...'
            ),
          ),

          Container(height: 15,),



          FlatButton(
            child: Text('create note'),
            onPressed: (){
              _createNote();
            },
          )
        ],
      ),
      )
    );
  }
}