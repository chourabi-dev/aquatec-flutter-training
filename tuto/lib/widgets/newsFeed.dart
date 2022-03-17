import 'package:flutter/material.dart';

class NewsFeed extends StatelessWidget {

  final int likes;
  final int comments;

  const NewsFeed({Key key, this.likes, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( bottom: 10 , left: 15 , right: 15 ),
      child: Card(
        elevation: 3,
        child: Container(
          child: Column( 
            children: [

                // image placeholde
                Container(
                  height: 300,
                  color: Colors.grey.shade300,
                  child: Image.asset('assets/bg.jpg',fit: BoxFit.cover, alignment: Alignment.center,),
                ), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    FlatButton(
                      onPressed: (){
                        print("clicked");
                      },
                      child: Text('$likes Like'),
                    ),
                    FlatButton(
                      child: Text('$comments comment'),
                    ),
                    FlatButton(
                      child: Text('share'),
                    ), 
                  ],

                )


                // social interactions


            ],
           ),
        ),
      ),
    );
  }
}