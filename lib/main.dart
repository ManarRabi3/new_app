import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';

void main (){



  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {

        HomeScreen.routName:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routName,


    );
  }
}






