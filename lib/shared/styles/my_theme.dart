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
          onSurface: Colors.white,
          secondary: black,
          surface: Colors.grey) ,
      scaffoldBackgroundColor: greenback,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: black,
        ),
        color: primarycolor,
        centerTitle: true,
      ),
      textTheme: TextTheme(
          headline1:TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,color: black,
          ),
        subtitle1: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: black
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:greenback,
        selectedItemColor: black,
        unselectedItemColor: Colors.white,
      )
  );
  static ThemeData darktmode = ThemeData(
      primaryColor: darkc,
      colorScheme:ColorScheme(onError: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          background: Colors.transparent,
          onPrimary: Colors.white,
          primary: darkc,
          brightness: Brightness.dark,
          onBackground: darkc,
          onSurface: Colors.white,
          secondary: darkc,
          surface: Colors.grey) ,
      scaffoldBackgroundColor: greenback,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        color:primarycolor,
        centerTitle: true,
      ),
      textTheme: TextTheme(
          headline1:TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,
          ),
          subtitle1: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white
          )

      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:darkc,
      selectedItemColor: darkc,
      unselectedItemColor: Colors.white,
    )
  );

}