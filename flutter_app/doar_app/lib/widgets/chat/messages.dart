import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:doar_app/widgets/chat/messagebubble.dart";

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentUid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy("createAt", descending: true)
          .snapshots(),
      builder: (context, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data.docs; // FIXME 

        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) => Container(
            child: MessageBubble(
              chatDocs[index]["username"],
              chatDocs[index]["text"],
              chatDocs[index]["avatar"],
              chatDocs[index]["userId"] == currentUid,
              key: ValueKey(chatDocs[index].id),
            ),
          ),
          itemCount: chatDocs.length,
        );
      },
    );
  }
}
