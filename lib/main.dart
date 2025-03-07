import 'package:flutter/material.dart';
import 'package:flutter_application_caffe_shop/screens/welcome_screend.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF212325), // Correcto
      ),
      home: WelcomeScreen(),
    );
  }
}
