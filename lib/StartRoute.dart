import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mccarthy_inf270_final_project/RegisterRoute.dart';
import 'package:http/http.dart' as http;
import 'package:mccarthy_inf270_final_project/Sport.dart';

class StartRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartRouteState();
  }

}

class StartRouteState extends State<StartRoute>{
  TextEditingController usernameController;
  TextEditingController passwordController;


  makePostRequest() async {
    String url = 'http://157.245.138.14:4444/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map data = {"username": usernameController.text, "password": passwordController.text};
    var body = json.encode(data);

    Response response = await http.post(url, headers: headers, body: body);

    int statusCode = response.statusCode;
    print("Status Code: " + statusCode.toString());

    if(statusCode == 200){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>Sport()
          ));
    }
    else{
      print("Something went wrong logging in");
    }
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter Username"
              ),
            ),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password"
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () async{
                      makePostRequest();

                    },
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>RegisterRoute()
                          ));
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