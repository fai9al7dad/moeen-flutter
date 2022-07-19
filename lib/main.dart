import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moeen/helpers/database/quran/database.dart';
// import 'package:moeen/helpers/database/quran/database.drift';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(
      Provider<QuranDB>(
        create: (context) => QuranDB(),
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(), // Wrap your app
        ),
        dispose: (context, db) => db.close(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: CustomRouter.routes,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      title: 'تطبيق معين',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfffff8ed),
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("test")),
          body: Center(
              child: TextButton(
                  onPressed: () => {print("low")}, child: Text("hello")))),
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