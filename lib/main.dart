import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_library_demo/ui/homePage.dart';
import 'package:open_library_demo/util/connectivitycontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePages(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController =
        Get.put(ConnectivityController());
    return Scaffold(
      backgroundColor: Colors.white70,
      body: HomePages(),
    );
  }
}
