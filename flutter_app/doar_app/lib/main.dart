import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doar_app/pages/login_page.dart';
import 'package:doar_app/pages/profile_page.dart';
import 'package:doar_app/mixin/palette_colors.dart';

//import './screens/home_screen.dart';
//import 'package:doar_app/database/sqlite_persistdata.dart';

// Chrome emulate: flutter run -d chrome

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
            theme: ThemeData(primaryColor: cyanThemeColor),
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
                color: whiteBackgroundColor,
                child: Image.asset(
                  'assets/images/logo.png',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Text('Seja bem vindo!',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
