import 'dart:ui';
import 'package:flutter/material.dart';
List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 3,
    offset: const Offset(1, 3),
  )
];

Color kWhiteBackground =
    const Color.fromARGB(255, 211, 208, 208).withOpacity(0.1);
const Color kWhitePrimary = Color(0xFFFFFFFF);
Color kWhiteOpacity = Colors.white.withOpacity(0.8);
const Color kBlack = Color.fromARGB(255, 3, 3, 3);
Color kGreyOutlined = Colors.grey.withOpacity(0.2);

const Color kGreyTextField = Color(0XFF7b7b7b);
const Color kGreyBackground = Color.fromARGB(255, 175, 173, 173);
const Color kPinkColor = Color(0XFFfb6e63);
const Color kRedColor = Colors.red;

double kContainerRadius = 24;
double kFullRadius = 20;
double kButtonRadius = 7;
double kSignoutButRadius = 10;
double kRadius = 40;