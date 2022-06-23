import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, 'items.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_items(id INTEGER PRIMARY KEY, countInCart INTEGER, inFavorite INTEGER, image TEXT, title TEXT, price INTEGER)');
        }, version: 5);
  }

  static Future<bool> insert(Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.insert('user_items', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  static Future<void> delete(int id) async {
    final db = await DBHelper.database();
    await db.rawDelete('DELETE FROM user_items WHERE id = $id');
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return await db.query('user_items');
  }

  static Future<void> removeData() async {
    final db = await DBHelper.database();
    await db.execute("DELETE FROM user_items");
  }
}

class ItemDBModel {
  final int id;
  final int countInCart;
  final int inFavorite;
  final String? title;
  final String? image;
  final int? price;

  const ItemDBModel(this.id, this.countInCart, this.inFavorite,
      {this.title, this.image, this.price});
}
