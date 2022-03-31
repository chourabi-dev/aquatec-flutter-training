import 'package:flutter/material.dart';

class PageHeroTwo extends StatefulWidget {
  final int index;
  
  PageHeroTwo({Key key, this.index}) : super(key: key);

  @override
  State<PageHeroTwo> createState() => _PageHeroTwoState();
}

class _PageHeroTwoState extends State<PageHeroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: 'hero-${widget.index}',
            child: Container(
            height: 500,
            child: Image.network('https://th.bing.com/th/id/R.f7d4ba71f77ddd55f3a6926f48a8fd10?rik=uIbyumocGDEbbw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-BIZl1fO4G-s%2fTneg_YRub3I%2fAAAAAAAADKM%2fF2I2eSAZ2Ng%2fs1600%2fAC-DC_The_Razor_Edge_Cover_HD_Wallpaper_Vvallpaper.Net.jpg&ehk=UbWwG7daMgP8F9Qm0Kp6IroARnbSZfoE2NETscmLNKg%3d&risl=&pid=ImgRaw&r=0'),

          ),
          ),

          Container(height: 15,),

          Text('hello world',style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}