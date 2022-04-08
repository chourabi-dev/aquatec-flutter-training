import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
          'likes':0,
          'user': {
            'uid':_auth.currentUser.uid,
            'email':_auth.currentUser.email,
            
          }
      }).then((value) {
        // notifcatiions

        _db.collection("users").get().then((res){

          var tokens =  [];

          for (var i = 0; i < res.docs.length; i++) {
              QueryDocumentSnapshot  doc = res.docs[i]; 
              tokens.add(doc.data()['fcm']);
          }


          for (var i = 0; i < tokens.length; i++) {
                                var headers = {
              'Authorization':
                  'key=AAAAvvWXAyw:APA91bFdAvDUSdBJefFMqXcQbCSPBXHn9_s-GhWaBbVFFIx9KzpvA3PnkKYioJIDLNydWdwiTca_bxJ0SaLwAZAjy-7ON0NjTQVA71uyzumtlvX9XuHPlUcwqOYdmXy5sZ8hbdMOrE_1',
              'Content-Type': 'application/json'
            };

            var body = '{\r\n "to" : "' +
                tokens[i] +
                '",\r\n "collapse_key" : "type_a",\r\n "notification" : {\r\n     "body" : "new content",\r\n     "title": "new public feed"\r\n },\r\n "data" : {\r\n     "body" : "Body of Your Notification in Data",\r\n     "title": "Title of Your Notification in Title",\r\n     "key_1" : "Value for key_1",\r\n     "key_2" : "Value for key_2"\r\n }\r\n}'
                    '';
            http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                headers: headers, body: body);
          }

        });

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