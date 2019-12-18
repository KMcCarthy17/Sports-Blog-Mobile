import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccarthy_inf270_final_project/ProFootball.dart';

class ProFootballRoute extends StatelessWidget{
  final ProFootball proFootball;

  ProFootballRoute(this.proFootball);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pro Football"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text("Title: " + proFootball.title),
              Padding(padding: EdgeInsets.all(10),),
              Text("Author: " + proFootball.author),
              Padding(padding: EdgeInsets.all(10),),
              Text("Post Date: " + proFootball.posted_timestamp),
              Padding(padding: EdgeInsets.all(10),),
              Text(proFootball.blog_body),
            ],
          ),
        ),
      ),
    );
  }

}