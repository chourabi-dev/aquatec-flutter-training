import 'package:flutter/material.dart';
import 'package:notes/pages/createNote.dart';
import 'package:notes/pages/noteDetails.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map> _list = [];


  _initData()async{

     Database  db = await openDatabase('note_db.db');

 await db.execute(
      'CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, note TEXT)'); 

     // Get the records
    List<Map> list = await db.rawQuery('SELECT * FROM notes');
    
    setState(() {
      _list = list;
    });
    print(list);

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Create new note",
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (ctx){
            return CreateNote( initdataFN: _initData, );
          }));

        },
      ),


      body: ListView.builder( itemCount: _list.length, itemBuilder: (context, index) {
        return (
          ListTile(
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new NoteDetailsPage( id: _list[index]["id"], content: _list[index]["note"],initdataFN: _initData, );
              },) );
            },
            trailing: IconButton(
              onPressed: () async{
                int id = _list[index]["id"];


                Database  db = await openDatabase('note_db.db'); 
              
                await db.transaction((txn) async {
                  int id1 = await txn.rawDelete('DELETE FROM notes WHERE id = $id');
                  print('deleted: $id1');

                  _initData();

                });
          

              },
              icon: Icon(Icons.delete,color: Colors.red,size: 35,),
            ),
            title: Text( _list[index]["note"].length >= 50 ?  _list[index]["note"].substring(0,50)+'...' : _list[index]["note"]   ),
            subtitle: Text('read more' ),
          )
        );
      }, ),
    );
  }
}