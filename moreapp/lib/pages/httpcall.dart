import 'package:flutter/material.dart';
import 'dart:convert';  
import 'package:http/http.dart';




class HttpCallExmpl extends StatefulWidget {
  HttpCallExmpl({Key key}) : super(key: key);

  @override
  State<HttpCallExmpl> createState() => _HttpCallExmplState();
}

class _HttpCallExmplState extends State<HttpCallExmpl> {


  List<dynamic> _data = [];


  getDataFrommServer(){
    get('https://jsonplaceholder.typicode.com/users').then((res) {
      //print(res.body);

    dynamic jsonRes = json.decode(res.body);  
     setState(() {
        _data = jsonRes;
     });


    }).catchError((err){
      print(err);
    });


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataFrommServer();

  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.builder( itemCount: _data.length, itemBuilder: (context, index) {
        return(
          ListTile(
            title: Text(_data[index]['name']),
            subtitle: Text(_data[index]['email']),
          )
        );
      }, ),
    );
  }
}