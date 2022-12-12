import 'package:newsapi/Repository/news_service.dart';
import 'package:newsapi/models/article.dart';
import 'package:newsapi/models/category.dart';

class NewsController{
  final NewsService service;

  NewsController(this.service);
  Future<List<Article>> fetchAll(){
    return service.fetchAll();
  }
  Future<List<Article>> fetchByCategory(category){
    return service.fetchByCategory(category);
  }
  Future<List<Article>> fetchBySearch(keyword){
    return service.fetchBySearch(keyword);
  }
}