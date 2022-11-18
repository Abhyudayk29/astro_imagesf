import 'package:Astro_ImagesF/apod.dart';
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
            "Astro Pic of the Day",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.white10,
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            ElevatedButton(

              child:
              Image.asset('assets/images/apod1.jpg',
                height: 400,
                width: 400,

                fit: BoxFit.fill,
              ),
              style:  ElevatedButton.styleFrom(

                backgroundColor: Color.fromARGB(255,25,25,112),
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext) {return apod();} ),);
              },
            ),




          ],),

        ));
  }
}
