import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


import 'LoginPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: LoginPage(),
        title: Text(
          'Çağdaş Bilim Koleji',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset("assets/images/logo1.png"),
        backgroundColor: Colors.white,
        photoSize: 100.0);
  }
}
