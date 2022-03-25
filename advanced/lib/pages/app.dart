import 'package:advanced/pages/appSetting.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  final dynamic themeChangeFN;

  AppPage({Key key, this.themeChangeFN}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (c){
                return AppSesstigPage( themeChangeFN: widget.themeChangeFN, );
              }));
            },
          )
        ],
      ),
    );
  }
}