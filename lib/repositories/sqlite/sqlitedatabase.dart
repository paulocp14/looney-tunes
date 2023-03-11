import 'dart:math';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../../main.dart';

Map<int, String> scripts = {
  1: ''' CREATE TABLE tarefa (
          id INT PRIMARY KEY AUTOINCREMENT,
          descricao TEXT,
          concluido INTEGER
          );'''
};

class SQLiteDataBase {
  static Database? db;
  Future<Database> obterdatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), "dataBase.db"),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugprint(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = 1; i < scripts.length; i++) {
        await db.execute(scripts[i]!);
        debugprint(scripts[i]!);
      }
    });

    return db;
  }
}
