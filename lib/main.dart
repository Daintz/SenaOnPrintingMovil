import 'package:flutter/material.dart';
import './Pum.dart';
import './Lotes.dart';

Map<int, Color> color =
{
  50:  const Color(0xff82def0),
  100: Color(0xFF69BED8),
  200: const Color(0xff5fafc7),
  300: Color(0xFF4792AF),
  400: const Color(0xff3e839e),
  500: const Color(0xff205975),
  600: const Color(0xff00324D),
  700: Color(0xFF183E52),
  800: Color(0xFF12394E),
  900: const Color(0xff00324D),
};

MaterialColor customColor = MaterialColor(0xff00324D, color);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customColor
  
      ),
    );
  }

  }
  
