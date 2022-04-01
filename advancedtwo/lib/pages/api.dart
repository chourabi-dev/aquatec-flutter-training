import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vibration/vibration.dart';

class ApiPageTesting extends StatefulWidget {
  ApiPageTesting({Key key}) : super(key: key);

  @override
  State<ApiPageTesting> createState() => _ApiPageTestingState();
}

class _ApiPageTestingState extends State<ApiPageTesting> {
  int _count;

  vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 1000);
    }
  }

  increment() {
    setState(() {
      _count = _count + 1;
    });

    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) {
          prefs.setInt('count', _count);
        })
        .catchError((e) {})
        .whenComplete(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _count = 0;

    SharedPreferences.getInstance()
        .then((SharedPreferences prefs) {
          setState(() {
            _count = prefs.getInt('count');
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            increment();
          },
          child: Text('clicked $_count times'),
        ),
      ),
    );
  }
}
