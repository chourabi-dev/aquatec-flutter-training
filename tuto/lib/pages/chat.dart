import 'package:flutter/material.dart';
import 'package:tuto/widgets/message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String tmpMessage = '';
  List<String> _messages = new List();

  TextEditingController _sendFeildControler = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (h - 70),
              child: ListView.builder( itemCount: _messages.length, itemBuilder: (context, index) {
                return MessageChat( message: _messages[index], outcome: true, );
                  
              }, ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Container(
                    width: w - 50,
                    child: TextField(
                      controller: _sendFeildControler,
                      decoration: InputDecoration(
                        hintText: "your message..."
                      ),

                      
                    ),
                  ),
                  Container(
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        tmpMessage = _sendFeildControler.text;
                        if (tmpMessage != '') {
                          List<String> tmpMsgArray = _messages;

                        tmpMsgArray.add(tmpMessage);

                        setState(() {
                          _messages =   tmpMsgArray;
                        });
                        // init tmpMessage
                        tmpMessage = '';

                        _sendFeildControler.text = '';
                        }
                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
