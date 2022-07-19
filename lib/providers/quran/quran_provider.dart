import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';
import 'package:moeen/helpers/general/constants.dart';

class QuranProvider with ChangeNotifier {
  // final wordsColorsMap = WordColorMap();
  // final _pageController = PageController();

  // List _quran = [];
  // List<WordColorMapModel> _mistakes = [];
  // bool _loadingGetData = false;

  // // late JoinedQuran _currentPage;
  // List<WordColorMapModel> get mistakes {
  //   return _mistakes;
  // }

  // bool get loadingGetData {
  //   return _loadingGetData;
  // }

  // PageController get pageController {
  //   return _pageController;
  // }

  // List get quran {
  //   return _quran;
  // }

  // void getData() async {
  //   _loadingGetData = true;
  //   var databaseHelper = DatabaseHelper();
  //   List q = await databaseHelper.getJoinedQuran();
  //   _quran = q;
  //   _loadingGetData = false;
  //   notifyListeners();
  // }

  // Future refreshData() async {
  //   var m = await wordsColorsMap.getAllColors();
  //   _mistakes = m;
  //   notifyListeners();
  // }

  // void addMistake(
  //     {required id,
  //     required pageNumber,
  //     required verseNumber,
  //     required chapterCode,
  //     color}) async {
  //   String newColor;
  //   newColor = MistakesColors.warning;
  //   if (color != null) {
  //     if (color == MistakesColors.warning) {
  //       newColor = MistakesColors.mistake;
  //     }
  //     if (color == MistakesColors.mistake) {
  //       newColor = MistakesColors.revert;
  //     }
  //   }

  //   // setState(() {
  //   //   _mistakes[id] = newMistake;
  //   // });
  //   // inspect(s);
  //   var word = WordColorMapModel(
  //       pageNumber: pageNumber,
  //       verseNumber: int.parse(verseNumber),
  //       chapterCode: chapterCode,
  //       color: newColor,
  //       wordID: id);
  //   await wordsColorsMap.insertWord(word);
  //   refreshData();
  //   // notifyListeners();
  // }
}
