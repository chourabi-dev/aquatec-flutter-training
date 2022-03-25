import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  final dynamic addFN;
  AddTodoPage({Key key, this.addFN}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  TextEditingController _title = new TextEditingController();
  TextEditingController _content = new TextEditingController();
  
  String _titleError = null;
  String _contentError = null;
  

  _checkValues(){
    String title = _title.text;
    String content = _content.text;

    if (title == '') {
      setState(() {
        _titleError = 'This feild is required';
      });
    }

    if (content == '') {
      setState(() {
        _contentError = 'This feild is required';
      });
    }


    if (content != '' && title != '') {
      _createTodo();
    }

  }


  _createTodo(){
    String title = _title.text;
    String content = _content.text;
    widget.addFN(title,content);

    // retour !!!!!

    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Create new todo'),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                //obscureText: true,
                
                controller: _title,
                decoration: InputDecoration(
                  icon: Icon(Icons.access_alarm),
                  labelText: "Todo title",
                  //hintText: "Todo title",
                  errorText: _titleError,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4))
                  )
                ),
              ),
            
            )
            ,
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                
                minLines: 2,
                maxLines: 5,
                controller: _content,
                decoration: InputDecoration(
                  hintText: "Todo content",
                  errorText: _contentError
                ),
              ),
            
            ),

            Container( 
              padding: EdgeInsets.only(left:10,right: 10),
              child: FlatButton(
                onPressed: (){
                  _checkValues();
                },
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Icon(Icons.add), Text('Create todo') ],
                ),
              ),
            )
            
            
          ],
        ),
      ),
      
    );
  }
}