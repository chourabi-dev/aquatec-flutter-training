import 'package:flutter/material.dart';

class AppSesstigPage extends StatefulWidget {
  final dynamic themeChangeFN;
  AppSesstigPage({Key key, this.themeChangeFN}) : super(key: key);

  @override
  State<AppSesstigPage> createState() => _AppSesstigPageState();
}

class _AppSesstigPageState extends State<AppSesstigPage> {

  
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
     
     body: Container(
       
       child: ListView(
        children: [
          ListTile(
            title: Text('App theme'),
            subtitle: Text('toggle between light and dark mode'),
            trailing: Switch(
              value: _active,
              onChanged: (bool val){
                setState(() {
                  _active = val;
                });

                widget.themeChangeFN();


              },
            ),
          )
        ],
      ),
     ),
    );
  }
}