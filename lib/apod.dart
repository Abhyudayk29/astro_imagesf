import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class apod extends StatelessWidget {
  apod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 25, 112),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Astronomy Picture of the Day",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.white10,
        ),
        body: FutureBuilder(
            future: apicall(),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "${snapshot.data['title'].toString()}",
                      style: TextStyle(color: Colors.lime, fontSize: 30),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    child:
                        Image.network("${snapshot.data['image'].toString()}"),
                  ),
                  Container(
                    child: Text(
                      "${snapshot.data['explanation'].toString()}",
                      style: TextStyle(color: Colors.lime, fontSize: 18),
                    ),
                  ),
                  Container(
                    child: Text("${snapshot.data['date'].toString()}",
                      style: TextStyle(
                          color:Colors.lime,
                          fontSize: 18
                      ),),
                  )
                ],
              );
            }));
  }
}

Future apicall() async {
  final url = Uri.parse(
      "https://api.nasa.gov/planetary/apod?api_key=6eETrKl14WbLgyK4AJwyVMgMHTIrgXanDRa8MSxZ");
  final response = await http.get(url);
  print(response.body);
  final json = jsonDecode(response.body);

  final output = {
    'date': json['date'],
    'explanation': json['explanation'],
    'title': json['title'],
    'image': json['hdurl']
  };
  return output;
}
