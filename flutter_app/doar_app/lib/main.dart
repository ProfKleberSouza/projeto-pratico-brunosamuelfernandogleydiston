import 'package:flutter/material.dart';
import 'package:doar_app/widgets/login_page.dart';
// import 'package:doar_app/database/persistdata_core.dart';

void main() => runApp(MyApp());

// Chrome emulate: flutter run -d chrome
class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  // final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main', // O título da aplicação
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Login(),
    );
  }
}
