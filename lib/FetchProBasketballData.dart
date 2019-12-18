import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ProBasketball.dart';
import 'ProBasketballNewPost.dart';
import 'ProBasketballRoute.dart';
import 'Sport.dart';

class FetchProBasketballData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FetchProBasketballDataState();
  }

}

class FetchProBasketballDataState extends State<FetchProBasketballData>{
  List<ProBasketball> list = List();
  var isLoading = false;

  fetchData() async{
    setState(() {
      isLoading = true;
    });
    list = [];

    final response =
    await http.get("http://157.245.138.14:4444/proBasketballPosts");
    //print("Response Body: " + response.body);
    if(response.statusCode == 200){
      dynamic body = json.decode(response.body);
      //print(body[0]);

      List jsonList = body;

      for(int i = 0; i < jsonList.length; i++){
        dynamic data = jsonList[i];
        ProBasketball pb = ProBasketball.fromJson(data);
        list.add(pb);
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
                        context) => ProBasketballRoute(list[index])
                ));
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Pro Basketball Posts"),
      ),

      body: isLoading ? progress: listView,
      floatingActionButton: RaisedButton(
        child: Text("New Blog Post"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (
                      context) => ProBasketballNewPost()
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