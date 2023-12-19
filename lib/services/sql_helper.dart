import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE verses(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      verseTitle TEXT,
      verse TEXT,
      date TEXT,
      emotions TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('verses.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(
      String verseTitle, String verse, String? date, String emotions) async {
    final db = await SQLHelper.db();

    final data = {
      'verseTitle': verseTitle,
      'verse': verse,
      'date': date,
      'emotions': emotions
    };
    final id = await db.insert('verses', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('verses', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('verses', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String verseTitle, String verse,
      String? date, String emotions) async {
    final db = await SQLHelper.db();
    final data = {
      'verseTitle': verseTitle,
      'verse': verse,
      'date': date,
      'emotions': emotions,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('verses', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("verses", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      // implement debugPrint method instead of print
      print("Something went wrong when deleting an item: $err");
    }
  }
}
