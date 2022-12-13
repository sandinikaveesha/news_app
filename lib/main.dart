import 'package:flutter/material.dart';
import 'package:newsapi/Provider/bookmark_provider.dart';
import 'package:newsapi/Provider/news_provider.dart';
import 'package:provider/provider.dart';
import './Screens/splash_screen.dart';


void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=> NewsModel()), ChangeNotifierProvider(create: (context) => BookmarkModel(),)],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News API',
      theme: ThemeData(
       
      ),
      home: const SplashScreen(),
    );
  }
}


