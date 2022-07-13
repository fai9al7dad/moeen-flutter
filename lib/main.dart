import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moeen/helpers/database/quran/quran_database_helper.dart';
import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';
import 'package:moeen/helpers/general/constants.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ListParent(),
    );
  }
}

class ListParent extends StatelessWidget {
  const ListParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (const Scaffold(body: RenderList()));
  }
}

class RenderList extends StatefulWidget {
  const RenderList({Key? key}) : super(key: key);

  @override
  State<RenderList> createState() => _RenderListState();
}

class _RenderListState extends State<RenderList> {
  List quran = [];
  bool _loading = true;

  void getData() async {
    var databaseHelper = DatabaseHelper();
    List _quran = await databaseHelper.getJoinedQuran();

    setState(() {
      quran = _quran;
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    if (_loading) {
      return Center(
        child: (CircularProgressIndicator(
          strokeWidth: 7,
          color: Colors.green[700],
        )),
      );
    }
    return (PageView.builder(
      controller: pageController,
      // reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      // scrollDirection: Axis.horizontal,
      itemCount: quran.length,
      itemBuilder: (context, index) {
        return RenderPage(page: quran[index]);
      },
      // itemBuilder: (context, index) {
      //   return RenderPage(lines: _items[index]["lines"]);
      // }
    ));
  }
}

class RenderPage extends StatefulWidget {
  final page;
  const RenderPage({Key? key, this.page}) : super(key: key);
  @override
  State<RenderPage> createState() => _RenderPageState();
}

class _RenderPageState extends State<RenderPage> {
  // Map<int, Mistake> mistakes = {};
  final wordsColorsMap = WordColorMap();
  List<WordColorMapModel> _mistakes = [];
  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future refreshData() async {
    var m = await wordsColorsMap.getAllColors();
    setState(() {
      _mistakes = m;
    });
  }

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
    await refreshData();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Center(
      child:
          // Text(mistakes[0].id.toString()),
          RichText(
        text: TextSpan(
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                height: 1.9,
                shadows: [
                  Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.5,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
            children: List.generate(widget.page.length, (index) {
              var item = widget.page[index];
              int curLineNum = widget.page[index]["lineNumber"];
              // if last item this will return undefined
              int aftLineNum = index != widget.page.length - 1
                  ? widget.page[index + 1]["lineNumber"]
                  : 15;
              bool lineChanged = curLineNum != aftLineNum;
              var found = _mistakes.firstWhereOrNull(
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
                    text: item["chapterCode"] + "\n",
                    style: const TextStyle(fontFamily: "surahname"));
              }
              if (item["charType"] == "end" && !lineChanged) {
                return TextSpan(
                    text: item["text"],
                    style: TextStyle(
                      color: Colors.deepOrange[900],
                      fontFamily: "p${widget.page[index]['pageNumber']}",
                    ));
              }
              if (item["charType"] == "end" && lineChanged) {
                return TextSpan(
                    text: item["text"] + "\n",
                    style: TextStyle(
                      color: Colors.deepOrange[900],
                      fontFamily: "p${widget.page[index]['pageNumber']}",
                    ));
              }
              return lineChanged
                  ? TextSpan(
                      text: "${widget.page[index]["text"]}\n",
                      style: TextStyle(
                        // color: found != null ? found.color : Colors.black,
                        fontFamily: "p${widget.page[index]['pageNumber']}",
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              addMistake(
                                id: item["wordID"],
                                pageNumber: item["pageNumber"],
                                verseNumber: item["verseNumber"],
                                chapterCode: item["chapterCode"],
                              )
                            })
                  : TextSpan(
                      text: index == 0
                          ? "${widget.page[index]['text']} "
                          : widget.page[index]["text"],
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
    );
  }
}

// class Word extends StatefulWidget {
//   var word;
//   var pageID;
//   Word({Key? key, this.word, this.pageID}) : super(key: key);

//   @override
//   State<Word> createState() => _WordState();
// }

// class _WordState extends State<Word> {
//   Color changedColor = Colors.black;

//   changeColor() {
//     setState(() {
//       changedColor = Colors.red;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(TextSpan(
//         text:widget.word,
//     )); 
//   }
// }
// style: TextStyle(
//             fontSize: 22,
//             fontFamily: "p${widget.pageID}",
//             color: changedColor,
//             shadows: const [
//               Shadow(
//                 offset: Offset(0, 0),
//                 blurRadius: 0.5,
//                 color: Color.fromARGB(255, 0, 0, 0),
//               ),
//             ]),