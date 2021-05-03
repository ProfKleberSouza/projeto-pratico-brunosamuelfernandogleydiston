import 'dart:async';
import 'package:doar_app/design/palette_colors.dart';
import 'package:doar_app/pages/chatusers_page.dart';
import 'package:doar_app/persistdata/user_db.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DocumentReference _documentReference;
  UserDetails _userDetails = UserDetails();
  var mapData = Map<String, String>();
  String uid;

  Future<FirebaseUser> signIn() async {
    FirebaseUser user =
        await _firebaseAuth.signInWithCredential(authCredential);
    return user;
  }

  void addDataToDb(FirebaseUser user) {
    _userDetails.name = user.displayName;
    _userDetails.emailId = user.email;
    _userDetails.photoUrl = user.photoUrl;
    _userDetails.uid = user.uid;
    mapData = _userDetails.toMap(_userDetails);

    uid = user.uid;

    _documentReference = Firestore.instance.collection("users").document(uid);

    _documentReference.get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => AllUsersScreen()));
      } else {
        _documentReference.setData(mapData).whenComplete(() {
          print('Users collection added to Database');
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => AllUsersScreen()));
        }).catchError((e) {
          print('Error adding collection to Database $e');
        });
      }
    });
  }
}
