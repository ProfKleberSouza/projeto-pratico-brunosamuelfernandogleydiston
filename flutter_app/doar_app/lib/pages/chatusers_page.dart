import 'dart:io';
import 'dart:async';
import 'package:doar_app/design/palette_colors.dart';
import 'package:doar_app/pages/profile_page.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doar_app/persistdata/message_db.dart';
import 'package:doar_app/persistdata/user_db.dart';
import 'package:doar_app/pages/chathome_page.dart';
import 'package:doar_app/pages/chat_page.dart';

class UsersScreen extends StatefulWidget {
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  StreamSubscription<QuerySnapshot> _subscription;
  List<DocumentSnapshot> usersList;
  final CollectionReference _collectionReference =
      Firestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    _subscription = _collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        usersList = datasnapshot.documents;
        print('Lista de contatos ${usersList.length}');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos Contatos'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await firebaseAuth.signOut();
                print('Sair');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
        body: usersList != null
            ? Container(
                child: ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(usersList[index].data['photoUrl']),
                      ),
                      title: Text(usersList[index].data['name'],
                        style: TextStyle(
                          color: blackFixedTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(usersList[index].data['emailId'],
                        style: TextStyle(
                          color: lightgreyBackgroundColor,
                        ),
                      ),
                      onTap: (() {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              name: usersList[index].data['name'],
                              photoUrl: usersList[index].data['photoUrl'],
                              receiverUid: usersList[index].data['uid'],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
            )
            : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}