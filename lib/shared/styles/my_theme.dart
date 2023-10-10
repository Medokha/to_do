import 'package:flutter/material.dart';

import 'colors.dart';

class my_theme{

  static ThemeData lightmode = ThemeData(
    primaryColor: primarycolor,
      colorScheme:ColorScheme(onError: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          background: Colors.transparent,
          onPrimary: Colors.white,
          primary: primarycolor,
          brightness: Brightness.light,
          onBackground: black,
          onSurface: Colors.black,
          secondary: black,
          surface: Colors.grey) ,
      scaffoldBackgroundColor: greenback,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: primarycolor,
        ),
        color: primarycolor,
      ),
      textTheme: TextTheme(
          headline1:TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
          ),
        subtitle1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: black
        ),
        subtitle2: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: primarycolor
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:Colors.transparent,
        elevation: 0,
        selectedItemColor: primarycolor,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primarycolor,
  )
  );
  static ThemeData darktmode = ThemeData(
      primaryColor: primarycolor,
      colorScheme:ColorScheme(onError: Colors.white,
          onSecondary: black,
          error: Colors.red,
          background: Colors.transparent,
          onPrimary: black,
          primary: primarycolor,
          brightness: Brightness.light,
          onBackground: black,
          onSurface: Colors.black,
          secondary: black,
          surface: Colors.grey) ,
      scaffoldBackgroundColor: darkc,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: primarycolor,
        ),
        color: primarycolor,
      ),
      textTheme: TextTheme(
        headline1:TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
        ),
        subtitle1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white
        ),
        subtitle2: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: primarycolor
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:Colors.transparent,
        elevation: 0,
        selectedItemColor: green,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: green,
      )
  );

}