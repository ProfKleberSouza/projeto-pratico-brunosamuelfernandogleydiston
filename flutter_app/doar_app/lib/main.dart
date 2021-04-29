import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doar_app/widgets/login_page.dart';
import 'package:doar_app/widgets/profile_page.dart';
//import './screens/home_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Splash(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Doar app',
            theme: ThemeData(
              primaryColor: const Color(0xff63dadb)
            ),
            home: result != null ? Profile(uid: result.uid) : Login(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                alignment: Alignment.center,
                height: 150.0,
                width: 150.0,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/logo.png',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Text(
              'Seja bem vindo!',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
