import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doar_app/services/sharedpreferencesmethods.dart';

class DatabaseMethods {
  // Add user to Firestore database
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  // Search user from Firestore database
  Future<Stream<QuerySnapshot>> getUserByUserName(String username) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .snapshots();
  }

  // Adding or sending message
  Future addMessage(
      String chatRoomId, String messageId, Map messageInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfoMap);
  }

  // Update Messages in Real Time
  updateLastMessageSend(String chatRoomId, Map lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  // Create Chat Room or Check/Connect if already exists
  createChatRoom(String chatRoomId, Map chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .get();

    if (snapShot.exists) {
      // Chatroom already exists
      return true;
    } else {
      // Chatroom does not exist
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  // Get Chatroom Messages Stream
  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        // .orderBy("ts")
        .snapshots();
  }

  // Get Chatroom List
  Future<Stream<QuerySnapshot>> getChatRooms() async {
    String? myUsername = await SharedPreferenceMethods().getUserName();
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .orderBy("lastMessageSendTs", descending: true)
        .where("users", arrayContains: myUsername)
        .snapshots();
  }

  // Get single user info for Charoom List Tile
  Future<QuerySnapshot> getUserInfo(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .get();
  }
}
