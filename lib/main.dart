import 'package:flutter/material.dart';
import './style.dart' as style;
       
void main() 
{
  runApp(MaterialApp
  (
    theme: style.theme,
    
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  int current_bottom_index = 1;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        actions: 
        [
          Icon(Icons.add_box_outlined),
        ],

        title: Text
        (
          'Instagram',
        ),

      ),

      body: 
      [
        Text('홈'),
        Text('쇼핑 페이지'),
      ][current_bottom_index],

      bottomNavigationBar: BottomNavigationBar
      (
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: 
        [
          BottomNavigationBarItem
          (
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),

          BottomNavigationBarItem
          (
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'shopping'
          ),
        ],
        onTap: (index) 
        {
          setState(() 
          {
            current_bottom_index = index;  
          });
        },
      ),
    );
  }
}
