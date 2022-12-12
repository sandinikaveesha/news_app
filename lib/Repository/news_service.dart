import 'package:newsapi/models/article.dart';

abstract class NewsService{
  Future<List<Article>> fetchAll();
  Future<List<Article>> fetchByCategory(category);
   Future<List<Article>> fetchBySearch(keyword);
}