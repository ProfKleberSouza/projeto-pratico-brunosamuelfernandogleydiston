import 'package:flutter/material.dart';
import 'package:doar_app/widgets/login_page.dart';
import 'package:doar_app/database/persistdata_core.dart';
// Chrome emulate: flutter run -d chrome 
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main', // O título da aplicação
      theme: ThemeData(
        primarySwatch: Colors.blue
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
