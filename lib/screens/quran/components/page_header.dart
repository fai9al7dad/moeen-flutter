import 'package:flutter/cupertino.dart';
import 'package:moeen/screens/quran/components/page_header_mistakes_and_warnings.dart';

class PageHeader extends StatelessWidget {
  final pageNumber;
  const PageHeader({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("data"),
      PageHeaderMistakesAndWarnings(pageNumber: pageNumber),
      const Text("data"),
    ]);
  }
}
