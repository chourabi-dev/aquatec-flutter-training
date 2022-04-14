import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';  
import 'package:http/http.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform; 
import 'package:wifi/wifi.dart';
import 'package:in_app_notification/in_app_notification.dart';



class VitaliaExmpl extends StatefulWidget {
  VitaliaExmpl({Key key}) : super(key: key);

  @override
  State<VitaliaExmpl> createState() => _VitaliaExmplState();
}

class _VitaliaExmplState extends State<VitaliaExmpl> {


  String _state = 'waiting for cmnd';




  Future<List<WifiNetwork>> loadWifiList() async {

    await WiFiForIoTPlugin.setEnabled(true);


    List<WifiNetwork> htResultNetwork;
   
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();


      for (var i = 0; i < htResultNetwork.length; i++) {
        print(htResultNetwork[i].ssid);

        if (htResultNetwork[i].ssid == 'Vitalia') {
          /*WiFiForIoTPlugin.connect(htResultNetwork[i].ssid,
            password: 'vitalia123',
            joinOnce: true,
            withInternet: false,
            security:  NetworkSecurity.WPA).then((value){
   




            });*/



        }
      }
 

    return htResultNetwork;
  }


  refreshData(){
    Timer timer = new Timer.periodic(Duration(seconds: 3), (time){
          get("http://192.168.4.1").then((res){
            print(res.body);

            setState(() {
              _state = res.body.toString();


            });

          }).catchError((err){
            print(err);
          });
    });
  }

  callVitalia(String state, BuildContext ctx){
    get("http://192.168.4.1/pompe?state="+state).then((res){
      print(res.body);

 

      /**
       * InAppNotification.of(context)..of(ctx).show(
        child: Text('hi'),
        onTap: (){ 
        },
        duration: Duration(seconds: 10)
      );
       */


      setState(() {
        _state = res.body.toString();
      });

    }).catchError((err){
      print("error vitalia");
      print(err);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


loadWifiList();
          
  }


connnectToWifi(ctx) async{
  


      await WiFiForIoTPlugin.setEnabled(true);


    List<WifiNetwork> htResultNetwork;
   
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();


      for (var i = 0; i < htResultNetwork.length; i++) {
        print(htResultNetwork[i].ssid);

        if (htResultNetwork[i].ssid == 'Vitalia') {
           var result = await Wifi.connection(htResultNetwork[i].ssid, 'vitalia123');
 
        }
      }
 

    

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Container(
            height: 50,

          ),

          Container(
            child: Text(_state),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: (){
                  callVitalia('on',context);
                },

                child: Text('ON'),
              ),
              FlatButton(
                onPressed: (){
                  callVitalia('off',context);
                },

                child: Text('OFF'),
              ),
 

              
              
            ],
          )
        ],
      ),
    );
  }
}