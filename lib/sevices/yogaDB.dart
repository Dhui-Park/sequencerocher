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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB("YogaStepsDB.db");
    return _database;
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    // id, bool(Seconds), text

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable1} (
      ${YogaModel.IDName} $idType,
      ${YogaModel.YogaName} $textType,
      ${YogaModel.ImageName} $textType,
      ${YogaModel.SecondsOrNot} $boolType
    )''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable2} (
      ${YogaModel.IDName} $idType,
      ${YogaModel.YogaName} $textType,
      ${YogaModel.ImageName} $textType,
      ${YogaModel.SecondsOrNot} $boolType
    )''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable3} (
      ${YogaModel.IDName} $idType,
      ${YogaModel.YogaName} $textType,
      ${YogaModel.ImageName} $textType,
      ${YogaModel.SecondsOrNot} $boolType
    )''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaSummary} (
      ${YogaModel.IDName} $idType,
      ${YogaModel.YogaWorkOutName} $textType,
      ${YogaModel.BackImg} $textType,
      ${YogaModel.TimeTaken} $textType,
      ${YogaModel.TotalNoOfWork} $textType,
    )''');
  }

  Future<Yoga?> Insert(Yoga yoga) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaTable1, yoga.toJson());
    return yoga.copy(id: id);
  }

  Future<YogaSummary?> InsertYogaSummary(YogaSummary yogaSum) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaSummary, yogaSum.toJson());
    return yogaSum.copy(id: id);
  }

  Future<List<YogaSummary>> readAllYogSum() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryRes = await db!.query(YogaModel.YogaSummary, orderBy: orderBy);
    return queryRes.map((json) => YogaSummary.fromJson(json)).toList();
  }

  Future<List<Yoga>> readAllYoga() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryRes = await db!.query(YogaModel.YogaTable1, orderBy: orderBy);
    return queryRes.map((json) => Yoga.fromJson(json)).toList();
  }

  Future<Yoga?> readOneYoga(int id) async {
    final db = await instance.database;
    final map = await db!.query(YogaModel.YogaTable1,
        columns: YogaModel.YogaTable1ColumnName,
        where: '${YogaModel.IDName} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Yoga.fromJson(map.first);
    } else {
      return null;
    }
  }
}
