import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'package:doar_app/database/persistdata_core.dart';

import 'package:doar_app/widgets/login_page.dart';
import 'package:doar_app/widgets/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// Chrome emulate: flutter run -d chrome
class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  // final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main', // O título da aplicação
      theme: ThemeData(primarySwatch: Colors.amber),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
        navigateAfterSeconds: result != null ? Profile(uid: result.uid) : Login(),
        seconds: 5,
        title: Text(
          'Welcome To Meet up!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}
