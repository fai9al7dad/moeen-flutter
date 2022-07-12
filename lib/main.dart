import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moeen/helpers/database/quran_database_helper.dart';
import 'package:moeen/helpers/database/quran_models.dart';

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
    return (Scaffold(body: RenderList()));
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
  // Fetch content from the json file
  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('constants/Quran.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["pages"];
  //     _loading = false;
  //   });
  // }

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
    if (_loading) return (const Text("loading"));
    return (PageView.builder(
      controller: pageController,
      // reverse: true,
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
  var page;
  RenderPage({Key? key, this.page}) : super(key: key);
  @override
  State<RenderPage> createState() => _RenderPageState();
}

class _RenderPageState extends State<RenderPage> {
  List<int> mistakes = [];

  void addMistake(id) {
    setState(() {
      mistakes = [...mistakes, id];
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
        child: Center(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontFamily: "p${widget.page[0]['pageNumber']}",
                fontSize: 20,
                height: 1.9),
            children: List.generate(widget.page.length, (index) {
              int curLineNum = widget.page[index]["lineNumber"];
              // if last item this will return undefined
              int aftLineNum = index != widget.page.length - 1
                  ? widget.page[index + 1]["lineNumber"]
                  : 15;
              bool lineChanged = curLineNum != aftLineNum;
              if (index == 0) {
                return TextSpan(
                    text: "${widget.page[index]["text"]} ",
                    style: TextStyle(
                        color: mistakes.contains(widget.page[index]["wordID"])
                            ? Colors.red
                            : Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => {addMistake(widget.page[index]["wordID"])});
              }
              return lineChanged
                  ? TextSpan(
                      text: "${widget.page[index]["text"]}\n",
                      style: TextStyle(
                          color: mistakes.contains(widget.page[index]["wordID"])
                              ? Colors.red
                              : Colors.black),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => {addMistake(widget.page[index]["wordID"])})
                  : TextSpan(
                      text: widget.page[index]["text"],
                      style: TextStyle(
                          color: mistakes.contains(widget.page[index]["wordID"])
                              ? Colors.red
                              : Colors.black),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => {addMistake(widget.page[index]["wordID"])});
            })),
        textAlign: TextAlign.center,
      ),
    ));
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