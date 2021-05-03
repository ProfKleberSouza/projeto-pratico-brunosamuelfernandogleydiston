import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:doar_app/services/databasemethods.dart';
import 'package:doar_app/screens/chatscreen.dart';

class ChatRoomListTile extends StatefulWidget {
  // final String profilePicUrl;
  // final String name;
  final String myUserName;
  final String lastMessage;
  final String chatRoomId;

  const ChatRoomListTile({
    // this.profilePicUrl,
    // this.name,
    required this.myUserName,
    required this.lastMessage,
    required this.chatRoomId,
  });
  @override
  _ChatRoomListTileState createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String name = '';
  String profilePicUrl = '';
  String lastMessage = '';
  String username = '';

  getThisUserInfo() async {
    try {
      username = widget.chatRoomId
          .replaceAll(widget.myUserName, "")
          .replaceAll("_", "");
      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserInfo(username);
      // print('something ${querySnapshot.docs[0].id}');
      name = querySnapshot.docs[0]["name"];
      profilePicUrl = querySnapshot.docs[0]["profileUrl"];
      setState(() {});
    } catch (e) {
      // print(e.toString());
    }
  }

  @override
  void initState() {
    getThisUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      chatWithUserName: username,
                      name: name,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              profilePicUrl,
              height: 50,
              width: 50,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.lastMessage),
            ],
          ),
        ],
      ),
    );
  }
}