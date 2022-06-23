import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

import '../model/order_model/order_model.dart';

class DBUser {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(dbPath, 'user.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, firstName TEXT, phone TEXT, whatsAppPhone TEXT, address TEXT, email TEXT, codeIso TEXT, partOfNumber TEXT, countryCode TEXT)');
    }, version: 2);
  }

  static Future<bool> insertUser(Map<String, Object> data) async {
    final db = await DBUser.database();
    await db.insert('user', data, conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  static Future<void> deleteUser(int id) async {
    final db = await DBUser.database();
    await db.rawDelete('DELETE FROM user WHERE id = $id');
  }

  static Future<User?> getUserData() async {
    final db = await DBUser.database();
    final list = await db.query('user');
    if (list.isEmpty) return null;

    final e = list.first;
    return User(
        firstName: e['firstName'] as String?,
        phone: e['phone'] as String?,
        whatsAppPhone: e['whatsAppPhone'] as String?,
        address: e['address'] as String?,
        email: e['email'] as String?,
        codeIso: e['codeIso'] as String?,
        phoneN: e['partOfNumber'] as String?,
        countryCode: e['countryCode'] as String?,
    );
  }

  static Future<void> removeUserData() async {
    final db = await DBUser.database();
    await db.execute("DELETE FROM user");
  }
}
