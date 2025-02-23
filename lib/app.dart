import 'package:flutter/material.dart';
import 'module_12_class_3.dart';
import 'module_13/module_13_class_1.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Module13Class1(),
    );
  }
}
