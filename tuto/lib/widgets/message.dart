import 'package:flutter/material.dart';

class MessageChat extends StatelessWidget {

  final String message;
  final bool outcome;
  
  const MessageChat({Key key, this.message, this.outcome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Row( 
        mainAxisAlignment: outcome ? MainAxisAlignment.end : MainAxisAlignment.start,

        children: [
          Container(
            
            color: outcome ? Colors.limeAccent : Colors.grey ,
            padding: EdgeInsets.all(15),
            child: Text(message),
          )
        ],
      )
    ;
  }
}