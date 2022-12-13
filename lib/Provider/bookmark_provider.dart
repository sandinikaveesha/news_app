import 'package:flutter/foundation.dart';
import 'package:newsapi/Utils/database_helper.dart';
import 'package:newsapi/models/bookmark.dart';

class BookmarkModel extends ChangeNotifier{
  //Injection
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  List<Bookmark> _bookmarks = [];

  List<Bookmark>  get bookmarks => _bookmarks;

  void fetchall() async{
    final response = await  _dbHelper.getAllBookmarks();
    _bookmarks = response;
    notifyListeners();
  }

  void delete(int id) async{
    final response = await _dbHelper.deleteBookmark(id);
    fetchall();
  }
}