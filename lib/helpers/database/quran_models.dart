class Page {
  String? chapterCode;
  int? id, pageNumber, hizbNumber, juz;
  Page({this.chapterCode, this.hizbNumber, this.id, this.juz, this.pageNumber});
}

class Line {
  int? id, pageID;
  Line({this.id, this.pageID});
}

class JoinedQuran {
  String? chapterCode,
      audioUrl,
      charType,
      isBismillah,
      transliteration,
      verseNumber;
  String text;
  int? id, hizbNumber, juz, lineID, isNewChapter;
  int pageNumber, lineNumber;
  JoinedQuran(
      {this.id,
      this.chapterCode,
      this.hizbNumber,
      this.juz,
      required this.pageNumber,
      this.audioUrl,
      this.charType,
      this.isBismillah,
      this.isNewChapter,
      this.lineID,
      required this.lineNumber,
      required this.text,
      this.transliteration,
      this.verseNumber});
}


// class Word {
//   int? ID, PageID;
//   Line(this.ID, this.PageID);
// }
