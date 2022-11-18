import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255,25,25,112),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Astro Images",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.white10,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,

          children: <Widget>[

            ElevatedButton(
              child:
              Image.asset('assets/images/apod1.jpg',

                fit: BoxFit.fill,
              ),
              style:  ElevatedButton.styleFrom(

                backgroundColor: Color.fromARGB(255,25,25,112),
              ),
              onPressed: () {},
            ),


            ElevatedButton(
              child:
              new Image.asset("assets/images/epic1.jpg",

                fit: BoxFit.fill,
              ),
              style:  ElevatedButton.styleFrom(

                backgroundColor: Color.fromARGB(255,25,25,112),
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              child:
              new Image.asset("assets/images/mr.jpg",

                fit: BoxFit.fill,
              ),
              style:  ElevatedButton.styleFrom(

                backgroundColor: Color.fromARGB(255,25,25,112),
              ),
              onPressed: () {},
            ),

          ],
        ));
  }
}
