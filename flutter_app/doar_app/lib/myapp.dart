import "package:doar_app/screens/loginscreen.dart";
import "package:doar_app/screens/profilescreen.dart";
import "package:doar_app/screens/splashscreen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "design/layoutcolors.dart";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
            title: "Doar app",
            theme: ThemeData(primaryColor: cyanThemeColor),
            home:
                result != null ? ProfileScreen(uid: result.uid) : LoginScreen(),
          );
        }
      },
    );
  }
}


/*
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_chat_firebase_2/services/auth.dart";
import "package:flutter_chat_firebase_2/views/home_page.dart";
import "package:flutter_chat_firebase_2/views/sign_in.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Firebase Chat",
      // home: SignIn(),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}

*/