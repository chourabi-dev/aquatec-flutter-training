import 'package:advanced/const.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {

  final String title;
  final String content;
  
  TodoCard({Key key, this.title, this.content}) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  bool _state = false;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( left: 10, right: 10, bottom: 10 ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
            Container(
              child: Text( widget.title ,style: _state ? new AppConst().prefDoneTitleStyle : new AppConst().prefTitleStyle,),
            ),
            Container(
              child: Text(widget.content, style :_state ? new AppConst().prefDoneTextStyle : new AppConst().prefTextStyle,),
            ),

            Divider(
              height: 20,
              color: Colors.grey.shade400,
              thickness: 2,
            ),


            _state == false ?
            Container(
              color: Colors.orange,
              child: FlatButton(
                child: Text('Close'),
                onPressed: (){
                  setState(() {
                    _state = true;
                  });
                },
              ),
            )
            :
            Container()
            
          ],),
        ),
      ),
    );
  }
}