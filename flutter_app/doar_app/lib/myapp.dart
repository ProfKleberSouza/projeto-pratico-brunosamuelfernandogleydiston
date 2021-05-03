import 'package:doar_app/screens/loginscreen.dart';
import 'package:doar_app/screens/profilescreen.dart';
import 'package:doar_app/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'design/palette.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: SplashScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Doar app',
            theme: ThemeData(primaryColor: cyanThemeColor),
            home:
                result != null ? ProfileScreen(uid: result.uid) : LoginScreen(),
          );
        }
      },
    );
  }
}
