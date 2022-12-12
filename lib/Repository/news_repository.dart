import 'dart:convert';

import 'package:newsapi/Repository/news_service.dart';

import '../models/article.dart';
import 'package:http/http.dart' as http;

class NewsRepository implements NewsService{
  @override
  Future<List<Article>> fetchAll() async{
    var url = Uri.parse("https://newsapi.org/v2/everything?q=all&sortBy=publishedAt&apiKey=b49277679077461da0b93b707a9a6057");
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
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?category=$category&apiKey=b49277679077461da0b93b707a9a6057");
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
    var url = Uri.parse("https://newsapi.org/v2/everything?q=$keyword&sortBy=publishedAt&apiKey=b49277679077461da0b93b707a9a6057");
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