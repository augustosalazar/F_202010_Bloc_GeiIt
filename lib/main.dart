import 'package:flutter/material.dart';
import 'architecture_example/bloc_pattern/bloc_home.dart';
import 'architecture_example/locator.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProviderGeit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocHome(),
    );
  }
}