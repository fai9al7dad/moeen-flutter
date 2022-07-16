import 'package:flutter/material.dart';
import 'package:moeen/helpers/database/quran/quran_database_helper.dart';
import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';
import 'package:moeen/screens/quran/components/render_page.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

class RenderQuranList extends StatefulWidget {
  const RenderQuranList({Key? key}) : super(key: key);

  @override
  State<RenderQuranList> createState() => _RenderQuranListState();
}

class _RenderQuranListState extends State<RenderQuranList> {
  final pageController = PageController();

  List quran = [];
  bool _loading = true;
  final wordsColorsMap = WordColorMap();
  List<WordColorMapModel> _mistakes = [];

  void getData() async {
    var databaseHelper = DatabaseHelper();
    List q = await databaseHelper.getJoinedQuran();

    setState(() {
      quran = q;
      _loading = false;
    });
  }

  void refreshData() async {
    var m = await wordsColorsMap.getAllColors();
    setState(() {
      _mistakes = m;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    refreshData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
        child: (CircularProgressIndicator(
          strokeWidth: 7,
          color: Colors.green[700],
        )),
      );
    }
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () => pageController.jumpToPage(89)),
        IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () => pageController.jumpToPage(0))
      ]),
      body: (PageView.builder(
        controller: pageController,
        allowImplicitScrolling: true,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: quran.length,
        itemBuilder: (context, index) {
          return RenderPage(
              page: quran[index], refreshData: refreshData, colors: _mistakes);
        },
        // itemBuilder: (context, index) {
        //   return RenderPage(lines: _items[index]["lines"]);
        // }
      )),
    );
  }
}
