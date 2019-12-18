import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mccarthy_inf270_final_project/Sport.dart';

import 'CollegeBasketball.dart';
import 'CollegeBasketballNewPost.dart';
import 'CollegeBasketballRoute.dart';

class FetchCollegeBasketballData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FetchCollegeBasketballDataState();
  }

}

class FetchCollegeBasketballDataState extends State<FetchCollegeBasketballData>{
  List <CollegeBasketball> list = [];
  var isLoading = false;

  fetchData() async{
    setState(() {
      isLoading = true;
    });
    list = [];

    final response =
    await http.get("http://157.245.138.14:4444/collegeBasketballPosts");
    //print("Response Body: " + response.body);
    if(response.statusCode == 200){
      dynamic body = json.decode(response.body);
      //print(body[0]);

      List jsonList = body;

      for(int i = 0; i < jsonList.length; i++){
        dynamic data = jsonList[i];
        CollegeBasketball cb = CollegeBasketball.fromJson(data);
        list.add(cb);
      }
      setState(() {
        isLoading = false;
      });
    }else{
      throw Exception('Failed to load Posts');
    }
  }


  @override
  void initState() {
    isLoading = false;
    list = [];
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Center progress = Center(
      child: CircularProgressIndicator(),
    );
    ListView listView = ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: new Text(list[index].title),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (
                        context) => CollegeBasketballRoute(list[index])
                ));
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("College Basketball Posts"),
      ),

      body: isLoading ? progress: listView,
      floatingActionButton: RaisedButton(
        child: Text("New Blog Post"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (
                      context) => CollegeBasketballNewPost()
              ));
        },
      ),
      bottomNavigationBar: RaisedButton(
        child: Text("All Sports"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (
                      context) => Sport()
              ));
        },
      ),
    );
  }

}