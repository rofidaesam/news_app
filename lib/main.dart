import 'package:flutter/material.dart';


import 'home_screen.dart';
import 'my_theme_data.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen()
      },
      theme: MyThemeData.light,

    );
  }
}