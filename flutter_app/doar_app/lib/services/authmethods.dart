import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:doar_app/services/databasemethods.dart';
import 'package:doar_app/services/sharedpreferencesmethods.dart';
import 'package:doar_app/screens/chathomescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    final user = auth.currentUser;
    return user;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);

    User userDetails = result.user;

    if (result != null) {
      SharedPreferenceMethods().saveUserEmail(userDetails.email);
      SharedPreferenceMethods().saveUserId(userDetails.uid);
      SharedPreferenceMethods().saveUserDisplayName(userDetails.displayName);
      SharedPreferenceMethods()
          .saveUserName(userDetails.email.replaceAll("@gmail.com", ""));
      SharedPreferenceMethods().saveUserProfilePicUrl(userDetails.photoURL);

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "username": userDetails.email.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        // "userId": userDetails.uid,
        "profileUrl": userDetails.photoURL
      };

      DatabaseMethods()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // for google
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    // for firebase
    await auth.signOut();
    print('Signed out successfully');
  }
}
