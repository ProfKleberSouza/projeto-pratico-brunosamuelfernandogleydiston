import 'package:flutter/material.dart';
import 'package:doar_app/widgets/login_page.dart';
import 'package:doar_app/database/persistdata_core.dart';
//import 'package:doar_app/widgets/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main', // O título da aplicação
      theme: ThemeData(
        primarySwatch: Colors.blue),
      // O tema utilizado, possui alguns outros atributos a serem
      // configurados como primarySwatch, brightness, primaryColor
      // e accentColor entre outros. No exemplo usamos apenas um
      // primarySwatch é definindo a classe Colors, que implementa
      // internamente as especificações de cores do Material Design.
      home: Login(),
      /*
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Login(),
        '/signin': (BuildContext context) => SignIn(),
        '/profile': (BuildContext context) => Profile()
      },
      */
      // A primeira tela a ser mostrada no aplicativo deve ser 
      // especificada dentro desse atributo. Telas flutuantes são 
      // distribuídas em rotas, neste caso home representa "/". 
      // Rotas podem ser configuradas usando o atributo routes;
      
    );
    
  }
}
