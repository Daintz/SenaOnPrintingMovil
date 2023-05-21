import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/side_menu.dart';
import 'package:senaonprintingmovil/entry_point.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EntryPoint(),
    );
  }
}