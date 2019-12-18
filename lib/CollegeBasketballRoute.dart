import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CollegeBasketball.dart';

class CollegeBasketballRoute extends StatelessWidget{
  final CollegeBasketball collegeBasketball;

  CollegeBasketballRoute(this.collegeBasketball);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("College Basketball"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text("Title: " + collegeBasketball.title),
              Padding(padding: EdgeInsets.all(10),),
              Text("Author: " + collegeBasketball.author),
              Padding(padding: EdgeInsets.all(10),),
              Text("Post Date: " + collegeBasketball.posted_timestamp),
              Padding(padding: EdgeInsets.all(10),),
              Text(collegeBasketball.blog_body),
            ],
          ),
        ),
      ),
    );
  }
}