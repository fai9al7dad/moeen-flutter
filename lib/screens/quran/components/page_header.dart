import 'package:flutter/material.dart';
import 'package:moeen/helpers/general/constants.dart';
import 'package:moeen/screens/quran/components/page_header_mistakes_and_warnings.dart';
import 'dart:math' as math;

class PageHeader extends StatelessWidget {
  final page;
  const PageHeader({Key? key, required this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textColor = int.parse(CustomColors.textColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(
        //     child: Row(children: [
        // ])),
        Row(
          children: [
            Text(
              "الحزب ${page["hizbNumber"].toString()}",
              style: TextStyle(
                  color: Color(textColor),
                  fontFamily: "montserrat",
                  fontSize: 12),
            ),
            const SizedBox(width: 5),
            Text(
              "الجزء ${page["juzNumber"].toString()}",
              style: TextStyle(
                  color: Color(textColor),
                  fontFamily: "montserrat",
                  fontSize: 12),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
          child: Row(children: [
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xfff7f0e7)),
              child: const Icon(
                Icons.unfold_more,
                size: 10,
                color: Color(0xffae8f74),
              ),
            ),
            const SizedBox(width: 3),
            Text(
              page["pageNumber"].toString(),
              style: TextStyle(
                  color: Color(textColor),
                  fontFamily: "montserrat",
                  fontSize: 12),
            ),
            const SizedBox(width: 5),
            Transform.scale(
                scaleX: page["pageNumber"] % 2 == 0 ? 1 : -1,
                child: Icon(
                  Icons.menu_book_rounded,
                  size: 18,
                  color: Color(textColor),
                )),
            const SizedBox(width: 5),
            PageHeaderMistakesAndWarnings(pageNumber: page["pageNumber"]),
          ]),
        ),
        const SizedBox(
          height: 0,
          width: 0,
        )
      ],
    );
  }
}
