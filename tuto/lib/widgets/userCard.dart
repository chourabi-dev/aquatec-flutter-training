import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {

  final String username;
  final String email;
  final bool connected;
  
  const UserCard({Key key, this.username, this.email, this.connected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.only( top: 15, bottom: 15 ),
          child: Column(

            children: [

                Container(
                  margin: EdgeInsets.only( bottom: 15 ),
                  child:  Stack(
                    overflow: Overflow.visible,
                    children: [

                      CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: NetworkImage('https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Free-Image.png'),
                  ),

                  Positioned(
                    right: -10,
                    child: Container(
                      height: 40,
                      width: 40,
                     decoration: BoxDecoration(
                        color: connected == true ? Colors.green.shade400 : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular( 50 ),
                        border: Border.all( color: Colors.white, width: 5 )
                     ),
                    ),
                  )

                    ],
                  ),
                ), 

                Text(username, style: TextStyle( color: Colors.blue.shade300, fontSize: 30, fontWeight: FontWeight.bold ),),
                Text(email, style: TextStyle( color: Colors.grey.shade500  ), ),
                


            ],
          ),
        ),
      ),
    );
  }
}