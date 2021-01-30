import 'package:BandApp/source/homer.dart';
import 'package:flutter/material.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Band App',
      initialRoute: 'home',
      routes: {
        'home':(_) => HomePage()
      },
    );
  }
}