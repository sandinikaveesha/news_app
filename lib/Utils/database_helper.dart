import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// class DatabaseHelper{
//   //Database Setting
//   static final _dbName = 'myNews.db';
//   static final _dbVersion = 1;

//   //Make Singleton
//   DatabaseHelper._();
//   static final DatabaseHelper instance = DatabaseHelper._();

//   static Database? _database;
//   Future<Database> get database async {
//     //Already created Database
//     if (_database != null) return _database!;

//     //Create a new Database
//     _database = await _initiateDatabase();
//     return _database!;
//   }

//   _initiateDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, _dbName);

//     return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
//   }
 
// }