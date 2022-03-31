import 'package:advancedtwo/widets/pageHeroTwo.dart';
import 'package:flutter/material.dart';

class PageHeroOne extends StatefulWidget {
  PageHeroOne({Key key}) : super(key: key);

  @override
  State<PageHeroOne> createState() => _PageHeroOneState();
}

class _PageHeroOneState extends State<PageHeroOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 5, itemBuilder: (context, index) {
        return ListTile(
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return PageHeroTwo(index: index,);
              },) );
            },
            leading: 
            Hero(
              tag: 'hero-$index',
              child: Container(
              height: 50,
              width: 50,
             child: Image.network('https://th.bing.com/th/id/R.f7d4ba71f77ddd55f3a6926f48a8fd10?rik=uIbyumocGDEbbw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-BIZl1fO4G-s%2fTneg_YRub3I%2fAAAAAAAADKM%2fF2I2eSAZ2Ng%2fs1600%2fAC-DC_The_Razor_Edge_Cover_HD_Wallpaper_Vvallpaper.Net.jpg&ehk=UbWwG7daMgP8F9Qm0Kp6IroARnbSZfoE2NETscmLNKg%3d&risl=&pid=ImgRaw&r=0'),
            
            ),
            )
            ,
            title: Text('hello world'),
            subtitle: Text('hello world'),
            
          );


      },),
    );
  }
}