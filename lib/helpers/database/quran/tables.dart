import 'package:drift/drift.dart';

class Page extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pageNumber => integer()();
  IntColumn get hizbNumber => integer()();
  IntColumn get juz => integer()();
  TextColumn get chapterCode => text()();

  // int? id, pageNumber, hizbNumber, juz;
}

class Lines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pageID => integer().references(Page, #id)();

  // int? id, pageID;
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lineID => integer().references(Lines, #id)();
  IntColumn get lineNumber => integer()();
  TextColumn get color => text()();
  TextColumn get word => text().named("text")();
  TextColumn get audioUrl => text()();
  TextColumn get chapterCode => text()();
  TextColumn get transliteration => text()();
  TextColumn get charType => text()();
  BoolColumn get isNewChapter => boolean()();
  BoolColumn get isBismillah => boolean()();
}

// class JoinedQuran {
//   String? chapterCode, audioUrl, charType, transliteration, verseNumber;
//   String text;
//   int? id, hizbNumber, juz, lineID, isNewChapter, wordID, isBismillah;
//   int pageNumber, lineNumber;
//   JoinedQuran(
//       {this.id,
//       this.chapterCode,
//       this.hizbNumber,
//       this.juz,
//       required this.pageNumber,
//       this.audioUrl,
//       this.charType,
//       this.isBismillah,
//       this.isNewChapter,
//       this.lineID,
//       required this.lineNumber,
//       required this.text,
//       this.transliteration,
//       this.verseNumber});
// }


// class Word {
//   int? ID, PageID;
//   Line(this.ID, this.PageID);
// }
