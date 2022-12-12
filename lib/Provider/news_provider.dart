import 'package:flutter/foundation.dart';
import 'package:newsapi/Controller/news_controller.dart';
import 'package:newsapi/Repository/news_repository.dart';
import 'package:newsapi/models/article.dart';

class NewsModel extends ChangeNotifier{
  //Injection
  var _newsController = NewsController(NewsRepository());

  List<Article> _news = [];
  String _status = "Loading";

  List<Article> get  newses => _news;
  String get status => _status;
  NewsModel();
  void filterByCategory(category) async{
    try{
      final response = await _newsController.fetchByCategory(category);
      _news = response;
      _status = "Completed";
    }
    catch(e){
      _status = "Error";
    }
    notifyListeners();
  }

  void searchNews(keyword) async{
    try {
      final response = await _newsController.fetchBySearch(keyword);
      _news = response;
       _status = "Completed";
    } catch (e) {
      _status = "Error";
    }
    notifyListeners();
  }
}