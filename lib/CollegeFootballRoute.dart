import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccarthy_inf270_final_project/CollegeFootball.dart';

class CollegeFootballRoute extends StatelessWidget{
  final CollegeFootball collegeFootball;

  CollegeFootballRoute(this.collegeFootball);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("College Football"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text("Title: " + collegeFootball.title),
              Padding(padding: EdgeInsets.all(10),),
              Text("Author: " + collegeFootball.author),
              Padding(padding: EdgeInsets.all(10),),
              Text("Post Date: " + collegeFootball.posted_timestamp),
              Padding(padding: EdgeInsets.all(10),),
              Text(collegeFootball.blog_body),
            ],
          ),
        ),
      ),
    );
  }

}