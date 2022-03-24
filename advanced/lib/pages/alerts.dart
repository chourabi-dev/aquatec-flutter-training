import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  AlertPage({Key key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {



_showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 

      Navigator.pop(context);

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(builder: (cx) {
        return Container(
         height: MediaQuery.of(context).size.height,
        child: Container(
        height: MediaQuery.of(context).size.height,
        child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text('Do you reealy want to delete this item'),

            FlatButton(child: Text('delete'), color: Colors.red, onPressed: (){
              _showAlertDialog(context);
            },),*/

            Text('Archive'),

            FlatButton(child: Text('Archive'), color: Colors.orange, onPressed: (){
             
              Scaffold.of(cx).showSnackBar(SnackBar(
                content: Text('hello world'),
                action: SnackBarAction(
                  label: 'undo',
                  onPressed: (){

                  },
                ),

              ));
            },),

            
          ],
        ),
      ),
      ),
      );


      },),
    );
  }
}