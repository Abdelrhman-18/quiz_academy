import 'package:injectable/injectable.dart';
import 'package:quiz_academy/features/results_history/data/models/result_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
@singleton
class DatabaseHelper {
  static Database? _database;
  static const dataBasePath ="quiz_app.db";
  static const userTable = "users";
  static const version = 2;


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), dataBasePath);
    return await openDatabase(
      path,
      version: version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add subject column if missing
      try {
        await db.execute("ALTER TABLE results ADD COLUMN subject TEXT");
        print("✅ Database upgraded: Added subject column to results table");
      } catch (e) {
        print("⚠️ Error upgrading database: $e");
      }
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $userTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        email TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        score INTEGER,
        total INTEGER,
        subject TEXT,
        date TEXT,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> register(String username, String password,String email) async {
    final db = await database;
    try {
      print('✅ User inserted with ID: $username');
      return await db.insert('users', {'username': username, 'password': password,'email':email});
    } catch (e) {
      return -1; 
    }
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final db = await database;
    List<Map<String, dynamic>> res = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (res.isNotEmpty) {
      return res.first; 
    }
    return null;
  }

  
  Future<int> saveResult(int userId, int score, int total, String subject) async {
    final db = await database;
    final resultId = await db.insert('results', {
      'user_id': userId,
      'score': score,
      'total': total,
      'subject': subject,
      'date': DateTime.now().toIso8601String(),
    });
    print('✅ Result saved: Subject=$subject, Score=$score/$total, UserId=$userId, ResultId=$resultId');
    return resultId;
  }

 Future<List<ResultHistoryModel>> getUserHistory(int userId) async {
  final db = await database;
  
  final List<Map<String, dynamic>> maps = await db.query(
    'results',
    where: 'user_id = ?',
    whereArgs: [userId],
    orderBy: 'date DESC',
  );

  return maps.map((map) => ResultHistoryModel.fromMap(map)).toList();
}
  Future<int> clearHistory(int userId) async {
  final db = await database;
  return await db.delete(
    'results',
    where: 'user_id = ?',
    whereArgs: [userId],
  );
}
}