import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:doar_app/screens/authscreen.dart';
import "package:doar_app/screens/loginscreen.dart";
import "package:doar_app/screens/profilescreen.dart";
import "package:doar_app/screens/splashscreen.dart";
import "package:doar_app/design/layoutcolors.dart";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Root of application
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: SplashScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Doar app",
            theme: ThemeData(primaryColor: cyanThemeColor),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return result != null
                      ? ProfileScreen(uid: result.uid)
                      : LoginScreen();
                }
                return AuthScreen();
              },
            ),
          );
        }
      },
    );
  }
}

/*
  // home: SignIn(),
  home: FutureBuilder(
    future: AuthMethods().getCurrentUser(),
    builder: (context, ) {
      if (snapshot.hasData) {
        return HomePage();
      } else {
        return SignIn();
      }
    },
  ),
*/
