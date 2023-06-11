import 'package:path/path.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:sqflite/sqflite.dart';

class QuoteLocalDatasource {
  static final QuoteLocalDatasource _instance = QuoteLocalDatasource._();

  factory QuoteLocalDatasource() => _instance;

  QuoteLocalDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quotes_.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        author TEXT,
        textAlign TEXT,
        backgroundColor INTEGER,
        fontSize REAL,
        fontWeight TEXT,
        wordSpacing REAL,
        letterSpacing REAL,
        isFavorite INTEGER
      )
    ''');
  }

  Future<int> addQuote(QuoteModel quote) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        Constants.dbTable,
        quote.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<QuoteList> getQuotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      Constants.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(maps.length, (index) {
      return QuoteModel.fromJson(maps[index]);
    });
  }

  Future<int> updateQuote(QuoteModel quote) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        Constants.dbTable,
        quote.toJson(),
        where: 'id = ?',
        whereArgs: [quote.id],
      );
    });
  }

  Future<int> deleteQuote(int id) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        Constants.dbTable,
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Future<QuoteModel?> getQuoteById(int id) async {
    final db = await database;
    final result = await db.query(
      Constants.dbTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? QuoteModel.fromJson(result.first) : null;
  }

  Future<QuoteList> searchQuote(String query) async {
    final db = await database;
    final map = await db.query(
      Constants.dbTable,
      where: 'text LIKE ? OR author LIKE?',
      whereArgs: ['%$query%', '%$query%'],
    );
    return List.generate(map.length, (index) {
      return QuoteModel.fromJson(map[index]);
    });
  }
}
