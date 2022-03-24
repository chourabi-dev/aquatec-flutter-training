import 'package:advanced/tabs/HomeTab.dart';
import 'package:flutter/material.dart';

class WhatsApp extends StatefulWidget {
  WhatsApp({Key key}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ));
  }
}
