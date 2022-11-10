import 'package:flutter/material.dart';

var _var1;

var theme = ThemeData
(
  textButtonTheme: TextButtonThemeData
  (
    style: TextButton.styleFrom
    (
      backgroundColor: Colors.grey,
    )
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData
  (
    selectedIconTheme: IconThemeData
    (
      color: Colors.black,
    ),
  ),

  iconTheme: IconThemeData
  (
    color: Colors.blue
  ),
  
  appBarTheme: AppBarTheme
  (
    color: Colors.white,
    actionsIconTheme: IconThemeData
    (
      color: Colors.black, 
      size: 30
    ),

    titleTextStyle: TextStyle
    (
      color: Colors.black,
      fontSize: 22,
    ),
    elevation: 1,
  ),
  
  textTheme: TextTheme
  (
    bodyText2: TextStyle(color: Colors.red),
  ),
);
