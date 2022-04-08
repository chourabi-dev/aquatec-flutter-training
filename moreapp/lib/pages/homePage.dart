import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moreapp/pages/createNote.dart';
import 'package:moreapp/pages/signin.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseMessaging _msg = FirebaseMessaging.instance;

  FirebaseFirestore _db = FirebaseFirestore.instance;

  _getMyFCM() {
    _msg.getToken().then((token) {
      print(token);
      String uid = _auth.currentUser.uid;

      _db.collection('users').where('uid', isEqualTo: uid).get().then((res) {
        _db
            .collection('users')
            .doc(res.docs[0].id)
            .update({'fcm': token}).then((value) {
          print('fcm updated');
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getMyFCM();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> strem = _db.collection('news').snapshots();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (ctx) => CreateNewStatus()));
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _auth.signOut();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (ctx) => new SigninPage()));
            },
          )
        ],
      ),
      body: Container(
          child: StreamBuilder(
              stream: strem,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something wen wrong !');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return new ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> feed = snapshot.data.docs[index].data();

                    String docId  = snapshot.data.docs[index].id;

                   /* _db.collection('news').doc(docId).update({
                      'views': feed['views'].add({ uid; date })
                    })*/

                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(feed['user']['email'], style: TextStyle(fontSize: 23  ),),
                          ),
                          Container(
                            child: Text(feed['createdAt'].toDate().toString()),
                          ),
                          Container(
                            child: Text(feed['content']),
                          ),
                          
                          
                        ],
                      ),
                    ),
                    );
                  },
                );
              })
              ),
    );
  }
}
