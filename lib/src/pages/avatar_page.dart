import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: [
           
            CircleAvatar(
              radius: 25.0,
              foregroundImage: NetworkImage('https://pbs.twimg.com/profile_images/640885747994771456/xJG9ttnL_400x400.jpg'),
              child: Text('AL'),
            ),

          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Color(-500),
              child: Text('AL'),
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/073 jar-loading.gif'), 
          image: NetworkImage('https://portal.andina.pe/EDPfotografia3/Thumbnail/2022/09/05/000896064W.jpg')),
      ),
    );
  }
}