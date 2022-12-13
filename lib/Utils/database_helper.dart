import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/bookmark.dart';

class DatabaseHelper {
  //Database Setting
  static final _dbName = 'myNews.db';
  static final _dbVersion = 1;

  //Make Singleton
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  Future<Database> get database async {
    //Already created Database
    if (_database != null) return _database!;

    //Create a new Database
    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${Bookmark.tblBookmark}(
        ${Bookmark.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Bookmark.colTitle} TEXT NOT NULL,
        ${Bookmark.colDescription} TEXT NOT NULL,
        ${Bookmark.colContent} TEXT,
        ${Bookmark.colPublished} TEXT,
        ${Bookmark.colSource} TEXT,
        ${Bookmark.colImg} TEXT
      )
    ''');
  }

  //Insert Bookmark
  Future<int> insertBookmark(Bookmark bookmark) async {
    Database db = await database;
    return await db.insert(Bookmark.tblBookmark, bookmark.toMap());
  }

  //Get All Bookmarks
  Future<List<Bookmark>> getAllBookmarks() async {
    Database db = await database;
    List<Map> bookmarks = await db.query(Bookmark.tblBookmark);
    return bookmarks.length == 0
        ? []
        : bookmarks.map((e) => Bookmark.fromMap(e)).toList();
  }

  //Remove Bookmark
  Future<int> deleteBookmark(int id) async {
    Database db = await database;
    return await db.delete(Bookmark.tblBookmark,
        where: '${Bookmark.colId}=?', whereArgs: [id]);
  }
}
