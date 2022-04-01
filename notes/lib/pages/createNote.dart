import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class CreateNote extends StatefulWidget {

  final dynamic initdataFN;
  CreateNote({Key key, this.initdataFN}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  TextEditingController _ctrl = new TextEditingController();



  _createNote() async{



    String val = _ctrl.text;

    if (val != '') {
      
      Database  db = await openDatabase('note_db.db'); 
       await db.execute(
      'CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, note TEXT)'); 
       await db.transaction((txn) async {
        int id1 = await txn.rawInsert('INSERT INTO notes(note) VALUES("$val")');
        print('inserted1: $id1');

        widget.initdataFN();

        Navigator.pop(context);
        
      });
 


    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new Note"),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
          children: [
            TextField(
              controller: _ctrl,
              minLines: 10,
              maxLines: 15,
              decoration: InputDecoration(
                hintText: 'Create your note...'
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: (){
                  _createNote();
                },
                color: Colors.green.shade300,
                child: Text('Create note'),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}