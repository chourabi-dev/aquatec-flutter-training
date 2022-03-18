import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({Key key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  int _count = 1;
  


  List<Widget> _generateChats(){

    List<Widget> tmp = new List();

    for (var i = 0; i < _count; i++) {
      tmp.add(ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            trailing: Text('15:19s'),
            title:Text('Chourabi taher') ,
            subtitle: Text('hello world...'),
          ));
    }

    return tmp;
  }

  
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Chats $_count'),
        actions: [

            IconButton(
              onPressed: (){
                print("clicked");
                setState(() {
                  _count = ( _count+1 );
                });
              },
              icon: Icon(Icons.plus_one),
            )
            
            ,
        ],
      ),


/**
 * ListView.builder(
        itemCount: _count,
        itemBuilder: (context, index) {
        return(
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            trailing: Text('15:19s'),
            title:Text('Chourabi taher') ,
            subtitle: Text('hello world...'),
          )
        );
      },)
 */
      body: ListView.builder(
        itemCount: _count,
        itemBuilder: (context, index) {
        return(
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            trailing: Text('15:19s'),
            title:Text('Chourabi taher') ,
            subtitle: Text('hello world...'),
          )
        );
      },)
      
      
      ,
    );
  }
}