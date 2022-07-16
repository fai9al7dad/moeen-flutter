import 'package:flutter/cupertino.dart';

import 'package:moeen/helpers/database/words_colors/WordsColorsMap.dart';

class PageHeaderMistakesAndWarnings extends StatefulWidget {
  const PageHeaderMistakesAndWarnings({Key? key}) : super(key: key);

  @override
  State<PageHeaderMistakesAndWarnings> createState() =>
      _PageHeaderMistakesAndWarningsState();
}

class _PageHeaderMistakesAndWarningsState
    extends State<PageHeaderMistakesAndWarnings> {
  final wordsColorsMap = WordColorMap();

  late Map<String, int> _mistakesAndWarnings;

  void setPageHeadersWarningsAndMistakes() async {
    Map<String, int> pwam = await wordsColorsMap.getPageColors(pageNumber: 2);
    setState(() {
      _mistakesAndWarnings = pwam;
    });
  }

  @override
  void initState() {
    super.initState();
    setPageHeadersWarningsAndMistakes();
  }

  @override
  Widget build(BuildContext context) {
    return Text("$_mistakesAndWarnings");
  }
}
