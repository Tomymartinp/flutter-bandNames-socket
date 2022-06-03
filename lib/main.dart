import 'package:flutter/material.dart';
import 'package:bandnames_app/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'Home',
      routes: {
        'Home':(_) => HomeScreen()
      },
    );
  }
}