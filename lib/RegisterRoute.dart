import 'dart:convert';
import 'dart:convert' as prefix0;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mccarthy_inf270_final_project/StartRoute.dart';

class RegisterRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterRouteState();
  }

}

class RegisterRouteState extends State<RegisterRoute>{
  TextEditingController usernameController;
  TextEditingController passwordController;

  makePostRequest() async {
    String url = 'http://157.245.138.14:4444/register';
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
              builder: (context)=>StartRoute()
          ));
    }
    else{
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                    child: Text("Register"),
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