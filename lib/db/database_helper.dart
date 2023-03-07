import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/umra_model.dart';


class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "umra.db");

// delete existing if any
    await deleteDatabase(path);

// Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

// Copy from asset
    ByteData data = await rootBundle.load(join("assets", "umra.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);


    return await openDatabase(path, version: 1,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // print("db version $version");
    // await db.execute('''
    // CREATE TABLE database(id INTEGER PRIMARY KEY, name TEXT)
    // ''');
  }

  Future<List<UmraModel>> getUmraMainMenu() async {
    Database db = await instance.database;
    var model = await db.rawQuery('Select * from tbl_step');
    List<UmraModel> modelList = model.isNotEmpty
        ? model.map((c) => UmraModel.fromMap(c)).toList()
        : [];

    return modelList;
  }


  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");

    await deleteDatabase(path);

    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    ByteData data = await rootBundle.load(join("assets", "main.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
}