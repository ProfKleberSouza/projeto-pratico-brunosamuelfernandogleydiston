import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:doar_app/services/sharedpreferencesmethods.dart";
import "package:doar_app/services/authmethods.dart";
import "package:doar_app/services/databasemethods.dart";
import "package:doar_app/screens/chatscreen.dart";
import "package:doar_app/screens/signinscreen.dart";
import "package:doar_app/widgets/chatroomlisttile.dart";
import "package:doar_app/design/layoutcolors.dart";

class ChatHomeScreen extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  //
  bool isSearching = false;
  Stream usersStream;
  Stream chatRoomsStream;

  final searchEditingController = TextEditingController();

  String myName, myProfilePic, myUserName, myEmail;

  // Get Data from SharedPreferences
  getMyInfoFromSharedPref() async {
    myName = await SharedPreferenceMethods().getUserDisplayName();
    myProfilePic = await SharedPreferenceMethods().getUserProfilePicUrl();
    myUserName = await SharedPreferenceMethods().getUserName();
    myEmail = await SharedPreferenceMethods().getUserEmail();
  }

  // Get the chat room streams
  getChatRoomList() async {
    chatRoomsStream = await DatabaseMethods().getChatRooms();
    setState(() {});
  }

  // we wait for sharedpref data and then get the streams
  onScreenLoaded() async {
    await getMyInfoFromSharedPref();
    getChatRoomList();
  }

  // Generate chatroom ID by using usernames
  getChatRoomIdByUserNames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  // Search Button click function
  onSearchButtonClick() async {
    setState(() {
      isSearching = true;
    });
    usersStream =
        await DatabaseMethods().getUserByUserName(searchEditingController.text);
    setState(() {});
    print("search clicked");
  }

  // Custom ListTile for chat list
  Widget searchUserListTile({String profileUrl, name, email, username}) {
    return GestureDetector(
      onTap: () {
        print("myname: $myUserName and partner name: $username");
        var chatRoomId = getChatRoomIdByUserNames(myUserName, username);
        Map<String, dynamic> chatRoomInfoMap = {
          "users": [myUserName, username]
        };

        DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: name,
              chatWithUserName: username,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              profileUrl,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text("Email: $email"),
                Text("User Name: $username"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom stream widget for users
  Widget searchUsersList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return searchUserListTile(
                      profileUrl: ds["profileUrl"],
                      name: ds["name"],
                      email: ds["email"],
                      username: ds["username"]);
                  // return Image.network(ds["profileUrl"]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  // Custom stream widget for chatrooms
  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  // return Text(
                  //   ds.id.replaceAll(myUserName, "").replaceAll("_", ""),
                  // );
                  return ChatRoomListTile(
                    lastMessage: ds["lastMessage"],
                    myUserName: myUserName,
                    chatRoomId: ds.id,
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  // Main build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthMethods().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  isSearching
                      ? Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearching = false;
                                searchEditingController.clear();
                              });
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: whiteBackgroundColor,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchEditingController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "User Name",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (searchEditingController.text != "" || null) {
                                onSearchButtonClick();
                              }
                            },
                            child: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isSearching ? searchUsersList() : chatRoomsList(),
            ],
          ),
        ),
      ),
    );
  }
}
