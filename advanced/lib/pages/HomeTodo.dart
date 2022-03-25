import 'package:advanced/models/Todo.dart';
import 'package:advanced/pages/AddTodoPage.dart';
import 'package:advanced/widgets/todoapp/todoCard.dart';
import 'package:flutter/material.dart';

class HomeTodoPage extends StatefulWidget {
  HomeTodoPage({Key key}) : super(key: key);

  @override
  State<HomeTodoPage> createState() => _HomeTodoPageState();
}

class _HomeTodoPageState extends State<HomeTodoPage> {

  List<Todo> _todos = [];

  _createTodo(String title, String content){
      Todo tmpTODO = new Todo(title, content);

      List<Todo> tmp = _todos;

      tmp.add(tmpTODO);

      setState(() {
        _todos = tmp;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(itemCount: _todos.length, itemBuilder: (context, index) {
        return TodoCard( title: _todos[index].title,content: _todos[index].content, );
      },),

      floatingActionButton: FloatingActionButton(
        tooltip: "Click to create a new todo",
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return AddTodoPage(  addFN: _createTodo,  );
          },) );

          
        },
      ),
    );
  }
}