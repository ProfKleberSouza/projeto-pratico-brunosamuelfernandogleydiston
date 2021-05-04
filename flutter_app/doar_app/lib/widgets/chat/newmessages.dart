import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  String _enteredText = "";
  final controller = TextEditingController();

  void m_sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser!; // nullsafety !
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance.collection("chat").add({
      "text": _enteredText,
      "createAt": Timestamp.now(),
      "userId": user.uid,
      "username": userData["username"],
      "avatar": userData["avatar"]
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Digite uma mensagem",
              ),
              onChanged: (value) {
                setState(() {
                  _enteredText = value;
                });
              },
              controller: controller,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _enteredText.trim().isEmpty ? null : m_sendMessage,
          ),
        ],
      ),
    );
  }
}
