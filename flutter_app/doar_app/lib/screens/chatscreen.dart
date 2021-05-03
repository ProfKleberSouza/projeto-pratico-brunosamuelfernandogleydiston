import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:doar_app/services/sharedpreferencesmethods.dart";
import "package:doar_app/services/databasemethods.dart";
import "package:doar_app/design/layoutcolors.dart";
import "package:random_string/random_string.dart";

class ChatScreen extends StatefulWidget {
  final String chatWithUserName, name;

  ChatScreen({@required this.chatWithUserName, @required this.name});
  //
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //
  String chatRoomId = "";
  String messageId = "";
  String myName, myProfilePic, myUserName, myEmail;

  var messageTextController = TextEditingController();

  Stream messageStream;

  // Get Data from SharedPreferences
  getMyInfoFromSharedPref() async {
    myName = await SharedPreferenceMethods().getUserDisplayName();
    myProfilePic = await SharedPreferenceMethods().getUserProfilePicUrl();
    myUserName = await SharedPreferenceMethods().getUserName();
    myEmail = await SharedPreferenceMethods().getUserEmail();
    chatRoomId = getChatRoomIdByUserNames(widget.chatWithUserName, myUserName);
  }

  // Generate chatroom ID by using usernames
  getChatRoomIdByUserNames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  // Add Messages
  addMessage(bool sendClicked) {
    if (messageTextController.text != "" || null) {
      String message = messageTextController.text;

      var lastMessageTs = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": myUserName,
        "ts": lastMessageTs,
        "profileUrl": myProfilePic
      };

      // messageId
      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      DatabaseMethods()
          .addMessage(
        chatRoomId,
        messageId,
        messageInfoMap,
      )
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendTs": lastMessageTs,
          "lastMessageSendBy": myUserName
        };

        DatabaseMethods().updateLastMessageSend(chatRoomId, lastMessageInfoMap);

        if (sendClicked) {
          // Remove texts from texfield after sending
          messageTextController.clear();

          // Make the messageId blank to regenerate next msg send
          messageId = "";
          // setState(() {});
        }
      });
    }
  }

  // Get previous messages/ history || realtime
  getAndSetMessages() async {
    messageStream = await DatabaseMethods().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  // Chat MessageTile
  Widget chatMessageTile(String message, bool sendByMe) {
    return Row(
      mainAxisAlignment:
          sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          // color: lightgreyBackgroundColor,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            message,
            style: TextStyle(
              color: whiteBackgroundColor,
            ),
          ),
          decoration: BoxDecoration(
            color: darkgreyBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: sendByMe ? Radius.circular(30) : Radius.circular(0),
              bottomRight: sendByMe ? Radius.circular(0) : Radius.circular(30),
            ),
          ),
        ),
      ],
    );
  }

  // Chat Messages Widget
  Widget chatMessages() {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return chatMessageTile(
                      ds["message"], myUserName == ds["sendBy"]);
                },
                reverse: true,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  // Function for init state
  doThisOnLaunch() async {
    await getMyInfoFromSharedPref();
    getAndSetMessages();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    doThisOnLaunch();
  }

  // Main widget body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 70,
              ),
              child: chatMessages(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: lightgreyBackgroundColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.withOpacity(0.8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        style: TextStyle(
                          color: whiteBackgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Digite uma mensagem...",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: whiteBackgroundColor,
                          ),
                        ),
                        onChanged: (value) {
                          addMessage(false);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        addMessage(true);
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
