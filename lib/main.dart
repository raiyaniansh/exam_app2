import 'package:exam_app2/home.dart';
import 'package:exam_app2/modal.dart';
import 'package:exam_app2/new.dart';
import 'package:exam_app2/second.dart';
import 'package:exam_app2/update.dart';
import 'package:flutter/material.dart';
List<Modal> modallist=[];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      'new': (context) => New(),
      'second':(context) => Sceond(),
      'update':(context) => Update(),
    },
  ),);
}