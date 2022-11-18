import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class apod extends StatelessWidget {
  apod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Astrongmy Picture of day"),
        ),
        body:
        FutureBuilder(
            future: apicall(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    child: Text("${snapshot.data['title'].toString()}"),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network("${snapshot.data['image'].toString()}"),
                  ),
                  Container(
                    child: Text("${snapshot.data['explanation'].toString()}"),
                  ),
                  Container(
                    child: Text("${snapshot.data['date'].toString()}"),
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
    'title':json['title'],
    'image': json['hdurl']
  };
  return output;
}
