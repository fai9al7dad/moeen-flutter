import 'package:flutter/cupertino.dart';

import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';
import 'package:moeen/providers/quran/quran_provider.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class PageHeaderMistakesAndWarnings extends StatelessWidget {
  final int pageNumber;

  PageHeaderMistakesAndWarnings({Key? key, required this.pageNumber})
      : super(key: key);

  final wordsColorsMap = WordColorMap();

  @override
  Widget build(BuildContext context) {
    return Consumer<QuranProvider>(builder: (context, quranProvider, _) {
      var ff = quranProvider.mistakes
          .firstWhereOrNull((element) => element.pageNumber == pageNumber);
      // print("ff ${ff!.mistakes}");
      // if(ff?.mistakes != null){
      // return Text(ff!.mistakes.toString());
      // }
      return Row(
        children: [
          Text(ff?.warnings.toString() ?? "0"),
          Text(" | "),
          Text(ff?.mistakes.toString() ?? "0"),
        ],
      );
    });
    // return Text("a");
  }
}
