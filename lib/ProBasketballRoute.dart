import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProBasketball.dart';

class ProBasketballRoute extends StatelessWidget{
  final ProBasketball proBasketball;

  ProBasketballRoute(this.proBasketball);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pro Basketball"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text("Title: " + proBasketball.title),
              Padding(padding: EdgeInsets.all(10),),
              Text("Author: " + proBasketball.author),
              Padding(padding: EdgeInsets.all(10),),
              Text("Post Date: " + proBasketball.posted_timestamp),
              Padding(padding: EdgeInsets.all(10),),
              Text(proBasketball.blog_body),
            ],
          ),
        ),
      ),
    );
  }

}