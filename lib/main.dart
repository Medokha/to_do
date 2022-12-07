import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/styles/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homelayout.routeName,
      routes: {
        homelayout.routeName :(context) =>homelayout(),
      },
      debugShowCheckedModeBanner: false,
      theme:my_theme.lightmode ,
      darkTheme: my_theme.darktmode,
      themeMode: ThemeMode.light,

    );
  }
}

