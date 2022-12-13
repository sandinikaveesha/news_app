import 'dart:convert';

import 'package:newsapi/Repository/news_service.dart';

import '../models/article.dart';
import 'package:http/http.dart' as http;

class NewsRepository implements NewsService{
  @override
  Future<List<Article>> fetchAll() async{
    var url = Uri.parse("https://newsapi.org/v2/everything?q=all&sortBy=publishedAt&language=en&apiKey=ea04b773aebb4851acbcc92088bd4f6d");
    var response = await http.get(url);
    if(response.statusCode == 200){
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> body= data["articles"];
      List<Article> articles = body.map((e) => Article.fromJson(e)).toList();
      return articles;
    }else{
      throw ("An Error Occurred!");
    }
  }

  @override
  Future<List<Article>> fetchByCategory(category) async{
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?category=$category&apiKey=ea04b773aebb4851acbcc92088bd4f6d");
    var response = await http.get(url);
    if(response.statusCode == 200){
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> body= data["articles"];
      List<Article> articles = body.map((e) => Article.fromJson(e)).toList();
      return articles;
    }else{
      throw ("An Error Occurred!");
    }
  }
    @override
   Future<List<Article>> fetchBySearch(keyword) async{
    var url = Uri.parse("https://newsapi.org/v2/everything?q=$keyword&sortBy=publishedAt&apiKey=ea04b773aebb4851acbcc92088bd4f6d");
    var response = await http.get(url);
    if(response.statusCode == 200){
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> body= data["articles"];
      List<Article> articles = body.map((e) => Article.fromJson(e)).toList();
      return articles;
    }else{
      throw ("An Error Occurred!");
    }
   }
}