import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moeen/helpers/database/quran/quran_models.dart';
import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';
import 'package:moeen/helpers/general/constants.dart';
import 'package:collection/collection.dart';
import 'package:moeen/screens/quran/components/page_header.dart'; // You have to add this manually, for some reason it cannot be added automatically

class RenderPage extends StatefulWidget {
  final List page;
  final refreshData;
  final List<WordColorMapModel> colors;
  const RenderPage(
      {Key? key, required this.page, this.refreshData, required this.colors})
      : super(key: key);
  @override
  State<RenderPage> createState() => _RenderPageState();
}

class _RenderPageState extends State<RenderPage> {
  // Map<int, Mistake> mistakes = {};
  final wordsColorsMap = WordColorMap();

  void addMistake(
      {required id,
      required pageNumber,
      required verseNumber,
      required chapterCode,
      color}) async {
    String newColor;
    newColor = MistakesColors.warning;
    if (color != null) {
      if (color == MistakesColors.warning) {
        newColor = MistakesColors.mistake;
      }
      if (color == MistakesColors.mistake) {
        newColor = MistakesColors.revert;
      }
    }

    // setState(() {
    //   _mistakes[id] = newMistake;
    // });
    // inspect(s);
    var word = WordColorMapModel(
        pageNumber: pageNumber,
        verseNumber: int.parse(verseNumber),
        chapterCode: chapterCode,
        color: newColor,
        wordID: id);
    await wordsColorsMap.insertWord(word);
    await widget.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child:
          // Text(mistakes[0]['id'].toString()),
          Column(
        children: [
          const PageHeader(),
          RichText(
            text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  height: 1.9,
                ),
                // shadows: [
                //   Shadow(
                //     offset: Offset(0.0, 0.0),
                //     blurRadius: 0.5,
                //     color: Color.fromARGB(255, 0, 0, 0),
                //   ),
                // ]),

                children: List.generate(widget.page.length, (index) {
                  var item = widget.page[index];
                  int curLineNum = widget.page[index]["lineNumber"];
                  // if last item this will return undefined
                  int aftLineNum = index != widget.page.length - 1
                      ? widget.page[index + 1]["lineNumber"]
                      : 15;
                  bool lineChanged = curLineNum != aftLineNum;
                  var found = widget.colors.firstWhereOrNull(
                      (element) => element.wordID == item["wordID"]);
                  //   found = mistakes.firstWhere(
                  //       (e) => e.id == widget.page[index]["wordID"]);
                  // }
                  // if()
                  if (item["isNewChapter"] == 1) {
                    if (item["isBismillah"] == 1 && item["pageNumber"] != 187) {
                      return const TextSpan(
                          text: "ﱁﱂﱃﱄ\n", style: TextStyle(fontFamily: "p1"));
                    }
                    return TextSpan(
                        text: "${item["chapterCode"]}\n",
                        style: const TextStyle(fontFamily: "surahname"));
                  }
                  if (item["charType"] == "end" && !lineChanged) {
                    return TextSpan(
                        text: item["text"],
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "p${widget.page[index]['pageNumber']}",
                        ));
                  }
                  if (item["charType"] == "end" && lineChanged) {
                    return TextSpan(
                        text: "${item["text"]}\n",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "p${widget.page[index]['pageNumber']}",
                        ));
                  }
                  return lineChanged
                      ? TextSpan(
                          text: "${widget.page[index]['text']}\n",
                          style: TextStyle(
                            color: found != null
                                ? Color(int.parse(found.color))
                                : Colors.black,
                            fontFamily: "p${widget.page[index]['pageNumber']}",
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  addMistake(
                                      id: item["wordID"],
                                      pageNumber: item["pageNumber"],
                                      verseNumber: item["verseNumber"],
                                      chapterCode: item["chapterCode"],
                                      color: found?.color)
                                })
                      : TextSpan(
                          text: index == 0
                              ? "${widget.page[index]['text']} "
                              : widget.page[index]['text'],
                          style: TextStyle(
                            color: found != null
                                ? Color(int.parse(found.color))
                                : Colors.black,
                            fontFamily: "p${widget.page[index]['pageNumber']}",
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  addMistake(
                                      id: item["wordID"],
                                      pageNumber: item["pageNumber"],
                                      verseNumber: item["verseNumber"],
                                      chapterCode: item["chapterCode"],
                                      color: found?.color)
                                });
                })),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
