import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text ('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(3.5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://vignette.wikia.nocookie.net/mrfz/images/a/a4/Nian_icon.png/revision/latest/scale-to-width-down/340?cb=20200201060352'),
              radius: 25,
            ),
          ),

          /*Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.green
            ),
          )*/
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://66.media.tumblr.com/023a562685a5c98a30dc0d2ae72486c3/d81a8e7853e6cfe0-ef/s500x750/040f02668d0026f592047fd10d8153cf6506c9ad.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
        )
      ),
    );
  }
}