 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moreapp/pages/check.dart';
import 'package:moreapp/pages/httpcall.dart';
import 'package:moreapp/pages/signin.dart';
import 'package:moreapp/pages/vitalia.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}


class CanGoAPP extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HttpCallExmpl(),
    );
  }
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _init = Firebase.initializeApp();

 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("oups");
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return CanGoAPP();
        }

        return Container();
      },
    );
  }
}