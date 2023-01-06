import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/loadingScreen/loadingScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '1st game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoadingScreen(),
    ),
  );
}
