import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/model/kontak.dart';
import 'package:uts/model/favorite.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'kontak.db';

    var kontakDatabase =
        openDatabase(path, version: 8, onCreate: _createDb);
    return kontakDatabase;
  }



  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS kontak');
    batch.execute('DROP TABLE IF EXISTS favorite');
    batch.execute('''
    CREATE TABLE kontak (
    idKontak INTEGER PRIMARY KEY AUTOINCREMENT,
      namaKontak TEXT,
      nomerKontak TEXT,
      alamatEmailKontak TEXT
    )
    ''');
    batch.execute('''
    CREATE TABLE favorite (
    idFavorite INTEGER PRIMARY KEY AUTOINCREMENT,
      namaFavorite TEXT,
      nomerFavorite TEXT,
      alamatEmailFavorite TEXT
    )
    ''');
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> selectKontak() async {
    Database db = await this.initDb();
    var mapList = await db.query('kontak', orderBy: 'namaKontak');
    return mapList;
  }

  

  Future<List<Map<String, dynamic>>> selectFavorite() async {
    Database db = await this.initDb();
    var mapList = await db.query('favorite', orderBy: 'namaFavorite');
    return mapList;
  }

  Future<int> insertKontak(Kontak object) async {
    Database db = await this.initDb();
    int count = await db.insert('kontak', object.toMap());
    return count;
  }

  Future<int> insertFavorite(Favorite object) async {
    Database db = await this.initDb();
    int count = await db.insert('favorite', object.toMap());
    return count;
  }

  Future<int> updateKontak(Kontak object) async {
    Database db = await this.initDb();
    int count = await db.update('kontak', object.toMap(),
        where: 'idKontak=?', whereArgs: [object.idKontak]);
    return count;
  }

  Future<int> updateFavorite(Favorite object) async {
    Database db = await this.initDb();
    int count = await db.update('favorite', object.toMap(),
        where: 'idFavorite=?', whereArgs: [object.idFavorite]);
    return count;
  }

  Future<int> deleteKontak(int idKontak) async {
    Database db = await this.initDb();
    int count = await db.delete('kontak', where: 'idKontak=?', whereArgs: [idKontak]);
    return count;
  }

  Future<int> deleteFavorite(int idFavorite) async {
    Database db = await this.initDb();
    int count = await db.delete('favorite', where: 'idFavorite=?', whereArgs: [idFavorite]);
    return count;
  }

  Future<List<Kontak>> getKontakList() async {
    var kontakMapList = await selectKontak();
    int count = kontakMapList.length;
    List<Kontak> kontakList = List<Kontak>();
    for (int i = 0; i < count; i++) {
      kontakList.add(Kontak.fromMap(kontakMapList[i]));
    }
    return kontakList;
  }

  Future<List<Favorite>> getFavoriteList() async {
    var favoriteMapList = await selectFavorite();
    int count = favoriteMapList.length;
    List<Favorite> favoriteList = List<Favorite>();
    for (int i = 0; i < count; i++) {
      favoriteList.add(Favorite.fromMap(favoriteMapList[i]));
    }
    return favoriteList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
