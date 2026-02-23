import 'package:e_cart/view/Tab_bar_screen/tab_bar_screen.dart';
import 'package:e_cart/view/Home_screen/home_screen.dart';
import 'package:e_cart/view/Login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: TabbarScreen(),
    );
  }
}
