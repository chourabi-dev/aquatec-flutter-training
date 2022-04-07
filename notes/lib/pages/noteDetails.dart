import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class NoteDetailsPage extends StatefulWidget {
  final int id;
  final String content;
  final dynamic initdataFN;
  
  NoteDetailsPage({Key key, this.id, this.content, this.initdataFN}) : super(key: key);

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {

  TextEditingController _ctrl = new TextEditingController();

  bool _isEditing = false;

  String _errorTxt = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ctrl.text = widget.content;
  }
  

  _updateNote() async{
    int id  = widget.id;

    String val = _ctrl.text;

    if (val != '') {
       setState(() {
        _errorTxt=null;
      });

      Database  db = await openDatabase('note_db.db'); 
     
       await db.transaction((txn) async {
        int id1 = await txn.rawUpdate('UPDATE notes SET note="$val" WHERE id = $id');
        print('updated: $id1');

        widget.initdataFN();
 
  
        
      });





    } else {
      setState(() {
        _errorTxt='This feild is required';
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              setState(() {
                _isEditing = true;
              });
            },
          )
        ],
      ),


      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              

              _isEditing == false ?
              
              GestureDetector(
                onDoubleTap: (){
                  setState(() {
                    _isEditing = true;
                  });
                },
                child: Text(widget.content),
              )
              
              :
              Container(
                child: Column(
                  children: [
                      TextField(
              controller: _ctrl,
              minLines: 10,
              maxLines: 15,
              decoration: InputDecoration(
                hintText: 'Create your note...',
                errorText: _errorTxt
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: (){
                  _updateNote();
                },
                color: Colors.green.shade300,
                child: Text('Update note'),
              ),
            )


                  ],
                ),
              ),


            


            ],
        ),
        
      ),
    );
  }
}