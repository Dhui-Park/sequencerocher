import "package:sequencerocher/model/model.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class YogaDatabase {
  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;
  YogaDatabase._init();

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    // id, bool(Seconds), text

    await db.execute('''
    CREATE TABLE BeginnerYoga (
      ${YogaModel.IDName} $idType,
      ${YogaModel.YogaName} $textType,
      ${YogaModel.ImageName} $textType,
      ${YogaModel.SecondsOrNot} $boolType
    )
    ''');
  }
}
