// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Page extends DataClass implements Insertable<Page> {
  final int id;
  final int pageNumber;
  final int hizbNumber;
  final int juz;
  final String chapterCode;
  Page(
      {required this.id,
      required this.pageNumber,
      required this.hizbNumber,
      required this.juz,
      required this.chapterCode});
  factory Page.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Page(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pageNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page_number'])!,
      hizbNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hizb_number'])!,
      juz: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}juz'])!,
      chapterCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page_number'] = Variable<int>(pageNumber);
    map['hizb_number'] = Variable<int>(hizbNumber);
    map['juz'] = Variable<int>(juz);
    map['chapter_code'] = Variable<String>(chapterCode);
    return map;
  }

  PagesCompanion toCompanion(bool nullToAbsent) {
    return PagesCompanion(
      id: Value(id),
      pageNumber: Value(pageNumber),
      hizbNumber: Value(hizbNumber),
      juz: Value(juz),
      chapterCode: Value(chapterCode),
    );
  }

  factory Page.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Page(
      id: serializer.fromJson<int>(json['id']),
      pageNumber: serializer.fromJson<int>(json['pageNumber']),
      hizbNumber: serializer.fromJson<int>(json['hizbNumber']),
      juz: serializer.fromJson<int>(json['juz']),
      chapterCode: serializer.fromJson<String>(json['chapterCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pageNumber': serializer.toJson<int>(pageNumber),
      'hizbNumber': serializer.toJson<int>(hizbNumber),
      'juz': serializer.toJson<int>(juz),
      'chapterCode': serializer.toJson<String>(chapterCode),
    };
  }

  Page copyWith(
          {int? id,
          int? pageNumber,
          int? hizbNumber,
          int? juz,
          String? chapterCode}) =>
      Page(
        id: id ?? this.id,
        pageNumber: pageNumber ?? this.pageNumber,
        hizbNumber: hizbNumber ?? this.hizbNumber,
        juz: juz ?? this.juz,
        chapterCode: chapterCode ?? this.chapterCode,
      );
  @override
  String toString() {
    return (StringBuffer('Page(')
          ..write('id: $id, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('hizbNumber: $hizbNumber, ')
          ..write('juz: $juz, ')
          ..write('chapterCode: $chapterCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pageNumber, hizbNumber, juz, chapterCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Page &&
          other.id == this.id &&
          other.pageNumber == this.pageNumber &&
          other.hizbNumber == this.hizbNumber &&
          other.juz == this.juz &&
          other.chapterCode == this.chapterCode);
}

class PagesCompanion extends UpdateCompanion<Page> {
  final Value<int> id;
  final Value<int> pageNumber;
  final Value<int> hizbNumber;
  final Value<int> juz;
  final Value<String> chapterCode;
  const PagesCompanion({
    this.id = const Value.absent(),
    this.pageNumber = const Value.absent(),
    this.hizbNumber = const Value.absent(),
    this.juz = const Value.absent(),
    this.chapterCode = const Value.absent(),
  });
  PagesCompanion.insert({
    this.id = const Value.absent(),
    required int pageNumber,
    required int hizbNumber,
    required int juz,
    required String chapterCode,
  })  : pageNumber = Value(pageNumber),
        hizbNumber = Value(hizbNumber),
        juz = Value(juz),
        chapterCode = Value(chapterCode);
  static Insertable<Page> custom({
    Expression<int>? id,
    Expression<int>? pageNumber,
    Expression<int>? hizbNumber,
    Expression<int>? juz,
    Expression<String>? chapterCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pageNumber != null) 'page_number': pageNumber,
      if (hizbNumber != null) 'hizb_number': hizbNumber,
      if (juz != null) 'juz': juz,
      if (chapterCode != null) 'chapter_code': chapterCode,
    });
  }

  PagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? pageNumber,
      Value<int>? hizbNumber,
      Value<int>? juz,
      Value<String>? chapterCode}) {
    return PagesCompanion(
      id: id ?? this.id,
      pageNumber: pageNumber ?? this.pageNumber,
      hizbNumber: hizbNumber ?? this.hizbNumber,
      juz: juz ?? this.juz,
      chapterCode: chapterCode ?? this.chapterCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (hizbNumber.present) {
      map['hizb_number'] = Variable<int>(hizbNumber.value);
    }
    if (juz.present) {
      map['juz'] = Variable<int>(juz.value);
    }
    if (chapterCode.present) {
      map['chapter_code'] = Variable<String>(chapterCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagesCompanion(')
          ..write('id: $id, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('hizbNumber: $hizbNumber, ')
          ..write('juz: $juz, ')
          ..write('chapterCode: $chapterCode')
          ..write(')'))
        .toString();
  }
}

class $PagesTable extends Pages with TableInfo<$PagesTable, Page> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageNumberMeta = const VerificationMeta('pageNumber');
  @override
  late final GeneratedColumn<int?> pageNumber = GeneratedColumn<int?>(
      'page_number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _hizbNumberMeta = const VerificationMeta('hizbNumber');
  @override
  late final GeneratedColumn<int?> hizbNumber = GeneratedColumn<int?>(
      'hizb_number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _juzMeta = const VerificationMeta('juz');
  @override
  late final GeneratedColumn<int?> juz = GeneratedColumn<int?>(
      'juz', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _chapterCodeMeta =
      const VerificationMeta('chapterCode');
  @override
  late final GeneratedColumn<String?> chapterCode = GeneratedColumn<String?>(
      'chapter_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pageNumber, hizbNumber, juz, chapterCode];
  @override
  String get aliasedName => _alias ?? 'pages';
  @override
  String get actualTableName => 'pages';
  @override
  VerificationContext validateIntegrity(Insertable<Page> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page_number')) {
      context.handle(
          _pageNumberMeta,
          pageNumber.isAcceptableOrUnknown(
              data['page_number']!, _pageNumberMeta));
    } else if (isInserting) {
      context.missing(_pageNumberMeta);
    }
    if (data.containsKey('hizb_number')) {
      context.handle(
          _hizbNumberMeta,
          hizbNumber.isAcceptableOrUnknown(
              data['hizb_number']!, _hizbNumberMeta));
    } else if (isInserting) {
      context.missing(_hizbNumberMeta);
    }
    if (data.containsKey('juz')) {
      context.handle(
          _juzMeta, juz.isAcceptableOrUnknown(data['juz']!, _juzMeta));
    } else if (isInserting) {
      context.missing(_juzMeta);
    }
    if (data.containsKey('chapter_code')) {
      context.handle(
          _chapterCodeMeta,
          chapterCode.isAcceptableOrUnknown(
              data['chapter_code']!, _chapterCodeMeta));
    } else if (isInserting) {
      context.missing(_chapterCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Page map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Page.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PagesTable createAlias(String alias) {
    return $PagesTable(attachedDatabase, alias);
  }
}

class Line extends DataClass implements Insertable<Line> {
  final int id;
  final int pageID;
  Line({required this.id, required this.pageID});
  factory Line.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Line(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pageID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page_i_d'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page_i_d'] = Variable<int>(pageID);
    return map;
  }

  LinesCompanion toCompanion(bool nullToAbsent) {
    return LinesCompanion(
      id: Value(id),
      pageID: Value(pageID),
    );
  }

  factory Line.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Line(
      id: serializer.fromJson<int>(json['id']),
      pageID: serializer.fromJson<int>(json['pageID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pageID': serializer.toJson<int>(pageID),
    };
  }

  Line copyWith({int? id, int? pageID}) => Line(
        id: id ?? this.id,
        pageID: pageID ?? this.pageID,
      );
  @override
  String toString() {
    return (StringBuffer('Line(')
          ..write('id: $id, ')
          ..write('pageID: $pageID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pageID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Line && other.id == this.id && other.pageID == this.pageID);
}

class LinesCompanion extends UpdateCompanion<Line> {
  final Value<int> id;
  final Value<int> pageID;
  const LinesCompanion({
    this.id = const Value.absent(),
    this.pageID = const Value.absent(),
  });
  LinesCompanion.insert({
    this.id = const Value.absent(),
    required int pageID,
  }) : pageID = Value(pageID);
  static Insertable<Line> custom({
    Expression<int>? id,
    Expression<int>? pageID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pageID != null) 'page_i_d': pageID,
    });
  }

  LinesCompanion copyWith({Value<int>? id, Value<int>? pageID}) {
    return LinesCompanion(
      id: id ?? this.id,
      pageID: pageID ?? this.pageID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pageID.present) {
      map['page_i_d'] = Variable<int>(pageID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinesCompanion(')
          ..write('id: $id, ')
          ..write('pageID: $pageID')
          ..write(')'))
        .toString();
  }
}

class $LinesTable extends Lines with TableInfo<$LinesTable, Line> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageIDMeta = const VerificationMeta('pageID');
  @override
  late final GeneratedColumn<int?> pageID = GeneratedColumn<int?>(
      'page_i_d', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES pages (id)');
  @override
  List<GeneratedColumn> get $columns => [id, pageID];
  @override
  String get aliasedName => _alias ?? 'lines';
  @override
  String get actualTableName => 'lines';
  @override
  VerificationContext validateIntegrity(Insertable<Line> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page_i_d')) {
      context.handle(_pageIDMeta,
          pageID.isAcceptableOrUnknown(data['page_i_d']!, _pageIDMeta));
    } else if (isInserting) {
      context.missing(_pageIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Line map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Line.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LinesTable createAlias(String alias) {
    return $LinesTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final int lineID;
  final int lineNumber;
  final String color;
  final String word;
  final String audioUrl;
  final String chapterCode;
  final String transliteration;
  final String charType;
  final bool isNewChapter;
  final bool isBismillah;
  Word(
      {required this.id,
      required this.lineID,
      required this.lineNumber,
      required this.color,
      required this.word,
      required this.audioUrl,
      required this.chapterCode,
      required this.transliteration,
      required this.charType,
      required this.isNewChapter,
      required this.isBismillah});
  factory Word.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Word(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      lineID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}line_i_d'])!,
      lineNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}line_number'])!,
      color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
      word: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text'])!,
      audioUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio_url'])!,
      chapterCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chapter_code'])!,
      transliteration: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transliteration'])!,
      charType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}char_type'])!,
      isNewChapter: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_new_chapter'])!,
      isBismillah: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_bismillah'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['line_i_d'] = Variable<int>(lineID);
    map['line_number'] = Variable<int>(lineNumber);
    map['color'] = Variable<String>(color);
    map['text'] = Variable<String>(word);
    map['audio_url'] = Variable<String>(audioUrl);
    map['chapter_code'] = Variable<String>(chapterCode);
    map['transliteration'] = Variable<String>(transliteration);
    map['char_type'] = Variable<String>(charType);
    map['is_new_chapter'] = Variable<bool>(isNewChapter);
    map['is_bismillah'] = Variable<bool>(isBismillah);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      lineID: Value(lineID),
      lineNumber: Value(lineNumber),
      color: Value(color),
      word: Value(word),
      audioUrl: Value(audioUrl),
      chapterCode: Value(chapterCode),
      transliteration: Value(transliteration),
      charType: Value(charType),
      isNewChapter: Value(isNewChapter),
      isBismillah: Value(isBismillah),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      lineID: serializer.fromJson<int>(json['lineID']),
      lineNumber: serializer.fromJson<int>(json['lineNumber']),
      color: serializer.fromJson<String>(json['color']),
      word: serializer.fromJson<String>(json['word']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      chapterCode: serializer.fromJson<String>(json['chapterCode']),
      transliteration: serializer.fromJson<String>(json['transliteration']),
      charType: serializer.fromJson<String>(json['charType']),
      isNewChapter: serializer.fromJson<bool>(json['isNewChapter']),
      isBismillah: serializer.fromJson<bool>(json['isBismillah']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lineID': serializer.toJson<int>(lineID),
      'lineNumber': serializer.toJson<int>(lineNumber),
      'color': serializer.toJson<String>(color),
      'word': serializer.toJson<String>(word),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'chapterCode': serializer.toJson<String>(chapterCode),
      'transliteration': serializer.toJson<String>(transliteration),
      'charType': serializer.toJson<String>(charType),
      'isNewChapter': serializer.toJson<bool>(isNewChapter),
      'isBismillah': serializer.toJson<bool>(isBismillah),
    };
  }

  Word copyWith(
          {int? id,
          int? lineID,
          int? lineNumber,
          String? color,
          String? word,
          String? audioUrl,
          String? chapterCode,
          String? transliteration,
          String? charType,
          bool? isNewChapter,
          bool? isBismillah}) =>
      Word(
        id: id ?? this.id,
        lineID: lineID ?? this.lineID,
        lineNumber: lineNumber ?? this.lineNumber,
        color: color ?? this.color,
        word: word ?? this.word,
        audioUrl: audioUrl ?? this.audioUrl,
        chapterCode: chapterCode ?? this.chapterCode,
        transliteration: transliteration ?? this.transliteration,
        charType: charType ?? this.charType,
        isNewChapter: isNewChapter ?? this.isNewChapter,
        isBismillah: isBismillah ?? this.isBismillah,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('lineID: $lineID, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('color: $color, ')
          ..write('word: $word, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('chapterCode: $chapterCode, ')
          ..write('transliteration: $transliteration, ')
          ..write('charType: $charType, ')
          ..write('isNewChapter: $isNewChapter, ')
          ..write('isBismillah: $isBismillah')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lineID, lineNumber, color, word, audioUrl,
      chapterCode, transliteration, charType, isNewChapter, isBismillah);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.lineID == this.lineID &&
          other.lineNumber == this.lineNumber &&
          other.color == this.color &&
          other.word == this.word &&
          other.audioUrl == this.audioUrl &&
          other.chapterCode == this.chapterCode &&
          other.transliteration == this.transliteration &&
          other.charType == this.charType &&
          other.isNewChapter == this.isNewChapter &&
          other.isBismillah == this.isBismillah);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<int> lineID;
  final Value<int> lineNumber;
  final Value<String> color;
  final Value<String> word;
  final Value<String> audioUrl;
  final Value<String> chapterCode;
  final Value<String> transliteration;
  final Value<String> charType;
  final Value<bool> isNewChapter;
  final Value<bool> isBismillah;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.lineID = const Value.absent(),
    this.lineNumber = const Value.absent(),
    this.color = const Value.absent(),
    this.word = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.chapterCode = const Value.absent(),
    this.transliteration = const Value.absent(),
    this.charType = const Value.absent(),
    this.isNewChapter = const Value.absent(),
    this.isBismillah = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required int lineID,
    required int lineNumber,
    required String color,
    required String word,
    required String audioUrl,
    required String chapterCode,
    required String transliteration,
    required String charType,
    required bool isNewChapter,
    required bool isBismillah,
  })  : lineID = Value(lineID),
        lineNumber = Value(lineNumber),
        color = Value(color),
        word = Value(word),
        audioUrl = Value(audioUrl),
        chapterCode = Value(chapterCode),
        transliteration = Value(transliteration),
        charType = Value(charType),
        isNewChapter = Value(isNewChapter),
        isBismillah = Value(isBismillah);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<int>? lineID,
    Expression<int>? lineNumber,
    Expression<String>? color,
    Expression<String>? word,
    Expression<String>? audioUrl,
    Expression<String>? chapterCode,
    Expression<String>? transliteration,
    Expression<String>? charType,
    Expression<bool>? isNewChapter,
    Expression<bool>? isBismillah,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lineID != null) 'line_i_d': lineID,
      if (lineNumber != null) 'line_number': lineNumber,
      if (color != null) 'color': color,
      if (word != null) 'text': word,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (chapterCode != null) 'chapter_code': chapterCode,
      if (transliteration != null) 'transliteration': transliteration,
      if (charType != null) 'char_type': charType,
      if (isNewChapter != null) 'is_new_chapter': isNewChapter,
      if (isBismillah != null) 'is_bismillah': isBismillah,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? lineID,
      Value<int>? lineNumber,
      Value<String>? color,
      Value<String>? word,
      Value<String>? audioUrl,
      Value<String>? chapterCode,
      Value<String>? transliteration,
      Value<String>? charType,
      Value<bool>? isNewChapter,
      Value<bool>? isBismillah}) {
    return WordsCompanion(
      id: id ?? this.id,
      lineID: lineID ?? this.lineID,
      lineNumber: lineNumber ?? this.lineNumber,
      color: color ?? this.color,
      word: word ?? this.word,
      audioUrl: audioUrl ?? this.audioUrl,
      chapterCode: chapterCode ?? this.chapterCode,
      transliteration: transliteration ?? this.transliteration,
      charType: charType ?? this.charType,
      isNewChapter: isNewChapter ?? this.isNewChapter,
      isBismillah: isBismillah ?? this.isBismillah,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lineID.present) {
      map['line_i_d'] = Variable<int>(lineID.value);
    }
    if (lineNumber.present) {
      map['line_number'] = Variable<int>(lineNumber.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (word.present) {
      map['text'] = Variable<String>(word.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (chapterCode.present) {
      map['chapter_code'] = Variable<String>(chapterCode.value);
    }
    if (transliteration.present) {
      map['transliteration'] = Variable<String>(transliteration.value);
    }
    if (charType.present) {
      map['char_type'] = Variable<String>(charType.value);
    }
    if (isNewChapter.present) {
      map['is_new_chapter'] = Variable<bool>(isNewChapter.value);
    }
    if (isBismillah.present) {
      map['is_bismillah'] = Variable<bool>(isBismillah.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('lineID: $lineID, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('color: $color, ')
          ..write('word: $word, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('chapterCode: $chapterCode, ')
          ..write('transliteration: $transliteration, ')
          ..write('charType: $charType, ')
          ..write('isNewChapter: $isNewChapter, ')
          ..write('isBismillah: $isBismillah')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _lineIDMeta = const VerificationMeta('lineID');
  @override
  late final GeneratedColumn<int?> lineID = GeneratedColumn<int?>(
      'line_i_d', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES lines (id)');
  final VerificationMeta _lineNumberMeta = const VerificationMeta('lineNumber');
  @override
  late final GeneratedColumn<int?> lineNumber = GeneratedColumn<int?>(
      'line_number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String?> color = GeneratedColumn<String?>(
      'color', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String?> word = GeneratedColumn<String?>(
      'text', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _audioUrlMeta = const VerificationMeta('audioUrl');
  @override
  late final GeneratedColumn<String?> audioUrl = GeneratedColumn<String?>(
      'audio_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _chapterCodeMeta =
      const VerificationMeta('chapterCode');
  @override
  late final GeneratedColumn<String?> chapterCode = GeneratedColumn<String?>(
      'chapter_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _transliterationMeta =
      const VerificationMeta('transliteration');
  @override
  late final GeneratedColumn<String?> transliteration =
      GeneratedColumn<String?>('transliteration', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _charTypeMeta = const VerificationMeta('charType');
  @override
  late final GeneratedColumn<String?> charType = GeneratedColumn<String?>(
      'char_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isNewChapterMeta =
      const VerificationMeta('isNewChapter');
  @override
  late final GeneratedColumn<bool?> isNewChapter = GeneratedColumn<bool?>(
      'is_new_chapter', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_new_chapter IN (0, 1))');
  final VerificationMeta _isBismillahMeta =
      const VerificationMeta('isBismillah');
  @override
  late final GeneratedColumn<bool?> isBismillah = GeneratedColumn<bool?>(
      'is_bismillah', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_bismillah IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        lineID,
        lineNumber,
        color,
        word,
        audioUrl,
        chapterCode,
        transliteration,
        charType,
        isNewChapter,
        isBismillah
      ];
  @override
  String get aliasedName => _alias ?? 'words';
  @override
  String get actualTableName => 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('line_i_d')) {
      context.handle(_lineIDMeta,
          lineID.isAcceptableOrUnknown(data['line_i_d']!, _lineIDMeta));
    } else if (isInserting) {
      context.missing(_lineIDMeta);
    }
    if (data.containsKey('line_number')) {
      context.handle(
          _lineNumberMeta,
          lineNumber.isAcceptableOrUnknown(
              data['line_number']!, _lineNumberMeta));
    } else if (isInserting) {
      context.missing(_lineNumberMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['text']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(_audioUrlMeta,
          audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta));
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('chapter_code')) {
      context.handle(
          _chapterCodeMeta,
          chapterCode.isAcceptableOrUnknown(
              data['chapter_code']!, _chapterCodeMeta));
    } else if (isInserting) {
      context.missing(_chapterCodeMeta);
    }
    if (data.containsKey('transliteration')) {
      context.handle(
          _transliterationMeta,
          transliteration.isAcceptableOrUnknown(
              data['transliteration']!, _transliterationMeta));
    } else if (isInserting) {
      context.missing(_transliterationMeta);
    }
    if (data.containsKey('char_type')) {
      context.handle(_charTypeMeta,
          charType.isAcceptableOrUnknown(data['char_type']!, _charTypeMeta));
    } else if (isInserting) {
      context.missing(_charTypeMeta);
    }
    if (data.containsKey('is_new_chapter')) {
      context.handle(
          _isNewChapterMeta,
          isNewChapter.isAcceptableOrUnknown(
              data['is_new_chapter']!, _isNewChapterMeta));
    } else if (isInserting) {
      context.missing(_isNewChapterMeta);
    }
    if (data.containsKey('is_bismillah')) {
      context.handle(
          _isBismillahMeta,
          isBismillah.isAcceptableOrUnknown(
              data['is_bismillah']!, _isBismillahMeta));
    } else if (isInserting) {
      context.missing(_isBismillahMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Word.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

abstract class _$QuranDB extends GeneratedDatabase {
  _$QuranDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PagesTable pages = $PagesTable(this);
  late final $LinesTable lines = $LinesTable(this);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pages, lines, words];
}
