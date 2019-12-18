import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';

import 'FetchCollegeBasketballData.dart';

class CollegeBasketballNewPost extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollegeBasketballNewPostState();
  }

}

class CollegeBasketballNewPostState extends State<CollegeBasketballNewPost>{
  TextEditingController titleController;
  TextEditingController authorController;
  TextEditingController blogBodyController;

  makePostRequest() async {
    String url = 'http://157.245.138.14:4444/collegebasketballnewpost';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map data = {"title": titleController.text, "author": authorController.text, "blog_body": blogBodyController.text};
    var body = json.encode(data);

    Response response = await http.post(url, headers: headers, body: body);

    int statusCode = response.statusCode;
    print("Status Code: " + statusCode.toString());

    if(statusCode == 200){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>FetchCollegeBasketballData()
          ));
    }
    else{
      print("Something went wrong");
    }
  }


  @override
  void initState() {
    titleController = TextEditingController();
    authorController = TextEditingController();
    blogBodyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter Title"
              ),
            ),
            TextField(
              controller: authorController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter Author"
              ),
            ),
            TextField(
              controller: blogBodyController,
              keyboardType: TextInputType.text,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Enter Blog Text"
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Submit Post"),
                    onPressed: () async{
                      makePostRequest();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}