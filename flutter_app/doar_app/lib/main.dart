import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:doar_app/widgets/login_page.dart';
import 'package:doar_app/widgets/profile_page.dart';
//import 'package:doar_app/database/persistdata_core.dart';

// Chrome emulate: flutter run -d chrome
// Theme colors:
// const Color(0xff63dadb)
// const Color(0xfff1ceaf)
// const Color(0xff2f2d2a)
// const Color(0xffaa8a6f)
// const Color(0xff767a76)
// const Color(0xff637e90)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Dados persistidos (Persitent Data) com SQLite
  // final dbUser = MyDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main', // O título da aplicação
      theme: ThemeData(primaryColor: const Color(0xff63dadb)),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
        navigateAfterSeconds:
            result != null ? Profile(uid: result.uid) : Login(),
        seconds: 5,
        title: Text(
          'Welcome To Meet up!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter"),
        loaderColor: const Color(0xff63dadb));
  }
}
