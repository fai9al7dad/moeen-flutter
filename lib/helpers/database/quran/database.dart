import "dart:io" as io;
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:moeen/helpers/database/quran/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = io.File(join(dbFolder.path, 'app.db'));
    if (!await file.exists()) {
      final blob = await rootBundle.load('assets/databases/quran.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    return NativeDatabase(file);
  });
}

// class PagesWithLinesWithWords {
//   EntryWithCategory(this.entry, this.category);

//   final TodoEntry entry;
//   final Category category;
//   final Category category;
// }
@DriftDatabase(tables: [Page, Lines, Words])
class QuranDB extends _$QuranDB {
  QuranDB() : super(_openConnection());
  int get schemaVersion => 1;

  Future<List<PageData>> get getAllPages => select(page).get();

  // see next section on how to parse the result
}
