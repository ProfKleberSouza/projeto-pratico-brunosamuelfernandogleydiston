import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doar_app/widgets/profile_page.dart';

class Dashboard extends StatelessWidget {
  Dashboard({this.uid = 'Nome'});
  final String uid;
  final String title = 'Doações';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                    (Route<dynamic> route) => false);
              });
            },
          ),





          
        ],
      ),
      















    );
  }
}