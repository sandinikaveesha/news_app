import 'package:flutter/foundation.dart';
import 'package:newsapi/Controller/news_controller.dart';
import 'package:newsapi/Repository/news_repository.dart';
import 'package:newsapi/models/article.dart';

class NewsModel extends ChangeNotifier{
  //Injection
  var _newsController = NewsController(NewsRepository());

  List<Article> _news = [];
  List<Article> _categoryList = [];
  List<Article> _searchList = []; 
  String _status = "Loading";

  List<Article> get  newses => _news;
  List<Article> get categories => _categoryList;
  List<Article> get serach => _searchList;
  String get status => _status;
  NewsModel();
  void filterByCategory(category) async{
    try{
      final response = await _newsController.fetchByCategory(category);
      _news = response;
      _categoryList = response;
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
      _searchList = response;
       _status = "Completed";
    } catch (e) {
      _status = "Error";
    }
    notifyListeners();
  }

  void newsAll() async{
    try {
      final response = await _newsController.fetchAll();
      _news = response;
      _status = "Completed";
    } catch (e) {
      _status = "Error";
    }
    notifyListeners();
  }

  bool sort = false;
  void sortfunc() {
    sort = !sort;
    if(sort == false){
      _searchList.sort((a,b)=> DateTime.parse(a.publishAt.toString()).compareTo(DateTime.parse(b.publishAt.toString())));
    }
    else{
      _searchList.sort((a,b)=> DateTime.parse(b.publishAt.toString()).compareTo(DateTime.parse(a.publishAt.toString())));
    }
    notifyListeners();
  }
}