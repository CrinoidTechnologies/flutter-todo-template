import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../utils/app_keys.dart';
import '../../utils/profile_keys.dart';
import '../models/profile.dart';

class ProfileDatasource {
  static final ProfileDatasource _instance = ProfileDatasource._();

  factory ProfileDatasource() => _instance;

  ProfileDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profile.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTableProfile} (
        ${ProfileKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ProfileKeys.email} TEXT,
        ${ProfileKeys.password} TEXT,
        ${ProfileKeys.firstName} TEXT,
        ${ProfileKeys.lastName} TEXT
      )
    ''');
  }

  Future<bool> createNewUser(Profile profile) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
            AppKeys.dbTableProfile,
            profile.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          ) !=
          0;
    });
  }

  Future<int> updateUser(Profile profile) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTableProfile,
        profile.toJson(),
        where: 'id = ?',
        whereArgs: [profile.id],
      );
    });
  }

  Future<Profile?> getUser(Profile profile) async {
    final db = await database;
    var items = await db.query(AppKeys.dbTableProfile,
        where: '${ProfileKeys.email} = ? and ${ProfileKeys.password} = ?',
        whereArgs: [
          profile.email,
          profile.password,
        ]);
    if (items.isNotEmpty) {
      return Profile.fromJson(items.first);
    }
    return null;
  }
}
