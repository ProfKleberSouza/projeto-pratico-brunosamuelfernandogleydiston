import 'dart:io';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:firebase_storage/firebase_storage.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:doar_app/widgets/auth/authform.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(authResult.user!.uid + '.jpeg');
        await ref.putFile(image).onComplete; // FIXME verificar atualização

        final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'userName': username,
          'email': email,
          'imageUrl': url,
        });
      }
    } on PlatformException catch (e) {
      var message = 'Ocorreu um erro, verifique suas credenciais';
      if (e.message != null) {
        message = e.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_isLoading, _submitAuthForm),
    );
  }
}
