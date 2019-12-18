import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccarthy_inf270_final_project/FetchProFootballData.dart';
import 'package:mccarthy_inf270_final_project/StartRoute.dart';

import 'FetchCollegeBasketballData.dart';
import 'FetchCollegeFootballData.dart';
import 'FetchProBasketballData.dart';

class Sport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SportState();
  }

}

class SportState extends State<Sport>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Pro Football"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>FetchProFootballData()
                    ));

              },
            ),
            RaisedButton(
              child: Text("College Football"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>FetchCollegeFootballData()
                    ));

              },
            ),
            RaisedButton(
              child: Text("Pro Basketball"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>FetchProBasketballData()
                    ));

              },
            ),
            RaisedButton(
              child: Text("College Basketball"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>FetchCollegeBasketballData()
                    ));

              },
            ),
            RaisedButton(
              child: Text("Logout"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>StartRoute()
                    ));

              },
            ),
          ],
        ),
      ),
    );
  }

}