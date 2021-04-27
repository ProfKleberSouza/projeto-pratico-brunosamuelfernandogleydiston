import 'package:flutter/material.dart';
import 'package:doar_app/widgets/login_page.dart';
//import 'package:doar_app/database/persistdata_core.dart';
// Chrome emulate: flutter run -d chrome
// Theme colors:
// const Color(0xff63dadb)
// const Color(0xfff1ceaf)
// const Color(0xff2f2d2a)
// const Color(0xffaa8a6f)
// const Color(0xff767a76)
// const Color(0xff637e90)

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  //final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff637e90)
      ),
      home: Login(),
      /*
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Login(),
        '/signin': (BuildContext context) => SignIn(),
        '/profile': (BuildContext context) => Profile()
      },
      */
    );
  }
}
