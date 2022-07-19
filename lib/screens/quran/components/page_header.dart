import 'package:flutter/material.dart';
import 'package:moeen/helpers/general/constants.dart';
import 'package:moeen/providers/quran/quran_provider.dart';
import 'package:moeen/screens/quran/components/page_header_mistakes_and_warnings.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

var textColor = int.parse(CustomColors.textColor);

class PageHeader extends StatelessWidget {
  final page;
  const PageHeader({Key? key, required this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

        Row(children: [
          PageNumber(pageNumber: page["pageNumber"]),
          PageHeaderMistakesAndWarnings(pageNumber: page["pageNumber"]),
        ]),
        SurahName(
          surah: page["chapterCode"],
        )
      ],
    );
  }
}

class SurahName extends StatelessWidget {
  final String surah;
  const SurahName({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, "/surah-list")},
      child: Row(
        children: [
          const Icon(Icons.unfold_more, size: 10, color: Color(0xffae8f74)),
          Text(
            "${surah}surah",
            style: TextStyle(
                color: Color(textColor), fontFamily: "surahname", fontSize: 18),
          ),
        ],
      ),
    );
  }
}

TextEditingController pageNumberController = TextEditingController();

class PageNumber extends StatelessWidget {
  final int pageNumber;
  PageNumber({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Consumer<QuranProvider>(
      builder: (context, quranProvider, _) => GestureDetector(
        onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('انتقل الى صفحة'),
            content: PageNumberForm(formKey: _formKey),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('الغاء'),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    quranProvider.pageController
                        .jumpToPage(int.parse(pageNumberController.text) - 1);
                    Navigator.pop(context, 'ok');
                  }
                },
                child: const Text('انتقل'),
              ),
            ],
          ),
        ),
        child: Row(
          children: [
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
            Text(pageNumber.toString(),
                style: const TextStyle(
                    color: Color(0xffae8f74),
                    fontSize: 12,
                    fontFamily: "montserrat")),
            const SizedBox(width: 5),
            Transform.scale(
                scaleX: pageNumber % 2 == 0 ? 1 : -1,
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 15,
                  color: Color(0xffae8f74),
                )),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class PageNumberForm extends StatefulWidget {
  final formKey;
  const PageNumberForm({Key? key, this.formKey}) : super(key: key);

  @override
  State<PageNumberForm> createState() => _PageNumberFormState();
}

class _PageNumberFormState extends State<PageNumberForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: TextFormField(
          controller: pageNumberController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            if (int.parse(value) > 604 || int.parse(value) < 1) {
              return 'الرجاء ادخل رقم بين 1-604';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'ادخل رقم الصفحة',
          ),
        ));
  }
}
