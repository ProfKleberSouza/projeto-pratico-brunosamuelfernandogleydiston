import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:doar_app/widgets/chat/messages.dart";
import "package:doar_app/widgets/chat/newmessages.dart";
import "package:doar_app/design/layoutcolors.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("Sair")
                    ],
                  ),
                ),
                value: "sair",
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == "sair") {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
