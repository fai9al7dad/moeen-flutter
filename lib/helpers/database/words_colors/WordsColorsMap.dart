import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const WordsColorsMapTable = "WordsColorsMap";

class WordColorMapModel {
  final int? id;
  final int wordID;
  final int pageNumber;
  final int verseNumber;
  final String chapterCode;
  final String color;

  const WordColorMapModel({
    this.id,
    required this.wordID,
    required this.chapterCode,
    required this.color,
    required this.pageNumber,
    required this.verseNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wordID': wordID,
      'pageNumber': pageNumber,
      'color': color,
      'verseNumber': verseNumber,
      'chapterCode': chapterCode,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$WordsColorsMapTable{id: $id, wordID: $wordID, pageNumber: $pageNumber, color: $color,verseNumber: $verseNumber,chapterCode: $chapterCode,}';
  }
}

class WordColorMap {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    final database = openDatabase(
      join(await getDatabasesPath(), '$WordsColorsMapTable.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'create table $WordsColorsMapTable (id INTEGER PRIMARY KEY NOT NULL,wordID INTEGER NOT NULL ON CONFLICT REPLACE,color TEXT NOT NULL,pageNumber INTEGER NOT NULL,verseNumber INTEGER NOT NULL,chapterCode TEXT NOT NULL)',
        );
      },
      version: 1,
    );
    _db = await database;
    return await database;
  }

  Future<void> insertWord(WordColorMapModel wcm) async {
    // Get a reference to the database.

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    var dbClient = await db;
    var payload = wcm.toMap();
    var isExist = await getColorByID(id: payload["wordID"]);
    // inspect(isExist);
    if (isExist != null) {
      dbClient!.delete(WordsColorsMapTable,
          where: "wordID = ?", whereArgs: [payload["wordID"]]);
    }
    await dbClient!.insert(
      WordsColorsMapTable,
      payload,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<WordColorMapModel>> getAllColors() async {
    // Get a reference to the database.
    var dbClient = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps =
        await dbClient!.query(WordsColorsMapTable);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return WordColorMapModel(
        id: maps[i]['id'],
        wordID: maps[i]['wordID'],
        chapterCode: maps[i]['chapterCode'],
        verseNumber: maps[i]['verseNumber'],
        pageNumber: maps[i]['pageNumber'],
        color: maps[i]['color'],
      );
    });
  }

  Future<void> deleteAllColors() async {
    // Get a reference to the database.
    var dbClient = await db;

    // Query the table for all The Dogs.
    await dbClient!.delete(WordsColorsMapTable);
  }

  Future getColorByID({id}) async {
    // Get a reference to the database.
    var dbClient = await db;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbClient!
        .query(WordsColorsMapTable, where: 'wordID = ?', whereArgs: [id]);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    if (maps.isNotEmpty) {
      return WordColorMapModel(
        id: maps[0]['id'],
        wordID: maps[0]['wordID'],
        chapterCode: maps[0]['chapterCode'],
        verseNumber: maps[0]['verseNumber'],
        pageNumber: maps[0]['pageNumber'],
        color: maps[0]['color'],
      );
    }
  }
}
