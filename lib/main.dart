import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


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
  int current_bottom_index = 0;

  List<dynamic> http_data = [];
  
  ScrollController scroll = ScrollController();
  
  @override
  void initState()
  {
    super.initState();

    // http_data 할당
    (() async
    {
      var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));

      if(result.statusCode == 200)
      {
        setState(() 
        {
          http_data = jsonDecode(result.body);

          print(http_data);
        });
      }

      else
      {
        throw Exception('http 요청 실패함 ㅅㄱ');
      }
    })();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        actions: 
        [
          IconButton
          (
            icon: Icon(Icons.add_box_outlined), 
            
            onPressed: () async
            {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery); 

              Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold
              (
                body: Text('앙녕항셍용'),
              ),));
            },
          ),
        ],

        title: Text
        (
          'Instagram',
        ),

      ),

      body: 
      [
        Container
        (
          width: double.infinity,
          height: double.infinity,

          child: (()
          {
            scroll.addListener(() async
            { 
              if(scroll.position.pixels == scroll.position.maxScrollExtent)
              {
                // 숙제
                var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more2.json'));

                if(result.statusCode == 200)
                {
                  setState(() 
                  {
                    http_data.add(jsonDecode(result.body));
                  });
                }

                else
                {
                  throw Exception('http 요청 실패함 ㅅㄱ');
                }
              }
            });

            if(http_data.isNotEmpty)
            {
              return ListView.builder
              (
                itemCount: http_data.length,

                controller: scroll,

                itemBuilder: (context, list_index) => Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: 
                  [
                    Image.network(http_data[list_index]['image']),
                    Text('좋아요 ${http_data[list_index]['likes']}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                    Text('글쓴이 ${http_data[list_index]['user']}', style: TextStyle(color: Colors.black,),),
                    Text('글내용 ${http_data[list_index]['content']}', style: TextStyle(color: Colors.black,),),
                  ],
                ),
              );
            }

            else
            {
              return Text('데이터 불러오는 중...');
            }
          })(), 
        ),

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
