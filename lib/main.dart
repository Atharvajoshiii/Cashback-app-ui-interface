import 'package:flutter/material.dart';
import 'package:todowebapp/animatedbackground/animatedbackground1.dart';
import 'package:todowebapp/auth/loginscreen.dart';
import 'package:todowebapp/pages/detialscreen.dart';
import 'package:todowebapp/pages/homepage.dart';
import 'package:todowebapp/pages/newfile.dart';
import 'package:todowebapp/pages/starterview.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarterView()
    );
  }
}
