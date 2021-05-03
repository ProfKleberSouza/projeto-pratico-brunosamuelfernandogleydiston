import "package:doar_app/myapp.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

// Chrome emulate: flutter run -d chrome

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
