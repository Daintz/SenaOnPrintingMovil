import 'package:flutter/material.dart';
import 'Lotes.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loteo de insumos')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Lotes()),
            );
          },
          child: Text('Ver lotes'),
        ),
      ),
    );
  }}