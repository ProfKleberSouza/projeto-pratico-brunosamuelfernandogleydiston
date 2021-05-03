import 'dart:io';
import 'dart:async';
import 'package:doar_app/design/palette_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:doar_app/persistdata/message_db.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  String name;
  String photoUrl;
  String receiverUid;
  ChatScreen({this.name, this.photoUrl, this.receiverUid});

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Message _message;
  var _formKey = GlobalKey<FormState>();
  var map = Map<String, dynamic>();
  CollectionReference _collectionReference;
  DocumentReference _receiverDocumentReference;
  DocumentReference _senderDocumentReference;
  DocumentReference _documentReference;
  DocumentSnapshot documentSnapshot;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _senderuid;
  var listItem;
  String receiverPhotoUrl, senderPhotoUrl, receiverName, senderName;
  StreamSubscription<DocumentSnapshot> subscription;
  File imageFile;
  StorageReference _storageReference;
  TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    
    _messageController = TextEditingController();
    getUID().then((user) {
      setState(() {
        _senderuid = user.uid;
        print("sender uid : $_senderuid");
        getSenderPhotoUrl(_senderuid).then((snapshot) {
          setState(() {
            senderPhotoUrl = snapshot['photoUrl'];
            senderName = snapshot['name'];
          });
        });
        getReceiverPhotoUrl(widget.receiverUid).then((snapshot) {
          setState(() {
            receiverPhotoUrl = snapshot['photoUrl'];
            receiverName = snapshot['name'];
          });
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  void addMessageToDb(Message message) async {
    print("Message : ${message.message}");
    map = message.toMap();

    print("Map : ${map}");
    _collectionReference = Firestore.instance
        .collection("messages")
        .document(message.senderUid)
        .collection(widget.receiverUid);

    _collectionReference.add(map).whenComplete(() {
      print("Messages added to db");
    });

    _collectionReference = Firestore.instance
        .collection("messages")
        .document(widget.receiverUid)
        .collection(message.senderUid);

    _collectionReference.add(map).whenComplete(() {
      print("Messages added to db");
    });

    _messageController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Form(
          key: _formKey,
          child: _senderuid == null
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    //buildListLayout(),
                    ChatMessagesListWidget(),
                    Divider(
                      height: 20.0,
                      color: blackUserTextColor,
                    ),
                    ChatInputWidget(),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
        ),
    );
  }

  Widget ChatInputWidget() {
    return Container(
      height: 55.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              splashColor: whiteBackgroundColor,
              icon: Icon(
                Icons.camera_alt,
                color: blackFixedTextColor
              ),
              onPressed: () {
                pickImage();
              },
            ),
          ),
          Flexible(
            child: TextFormField(
              validator: (String input) {
                if (input.isEmpty) {
                  return "Envie uma mensagem";
                }
              },
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Digite uma mensagem...",
                labelText: "Mensagem",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onFieldSubmitted: (value) {
                _messageController.text = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              splashColor: whiteBackgroundColor,
              icon: Icon(
                Icons.send,
                color: blackUserTextColor,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  sendMessage();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<String> pickImage() async {
    var selectedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = selectedImage;
    });
    _storageReference = FirebaseStorage.instance
        .ref()
        .child('${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask storageUploadTask = _storageReference.putFile(imageFile);
    var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();

    print("URL: $url");
    uploadImageToDb(url);
    return url;
  }

  void uploadImageToDb(String downloadUrl) {
    _message = Message.withoutMessage(
        receiverUid: widget.receiverUid,
        senderUid: _senderuid,
        photoUrl: downloadUrl,
        timestamp: FieldValue.serverTimestamp(),
        type: 'image');
    var map = Map<String, dynamic>();
    map['senderUid'] = _message.senderUid;
    map['receiverUid'] = _message.receiverUid;
    map['type'] = _message.type;
    map['timestamp'] = _message.timestamp;
    map['photoUrl'] = _message.photoUrl;

    print("Map : ${map}");
    _collectionReference = Firestore.instance
        .collection("messages")
        .document(_message.senderUid)
        .collection(widget.receiverUid);

    _collectionReference.add(map).whenComplete(() {
      print("Messages added to db");
    });

    _collectionReference = Firestore.instance
        .collection("messages")
        .document(widget.receiverUid)
        .collection(_message.senderUid);

    _collectionReference.add(map).whenComplete(() {
      print("Messages added to db");
    });
  }

  void sendMessage() async {
    print("Inside send message");
    var text = _messageController.text;
    print(text);
    _message = Message(
        receiverUid: widget.receiverUid,
        senderUid: _senderuid,
        message: text,
        timestamp: FieldValue.serverTimestamp(),
        type: 'text');
    print(
        "receiverUid: ${widget.receiverUid} , senderUid : ${_senderuid} , message: ${text}");
    print(
        "timestamp: ${DateTime.now().millisecond}, type: ${text != null ? 'text' : 'image'}");
    addMessageToDb(_message);
  }

  Future<FirebaseUser> getUID() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<DocumentSnapshot> getSenderPhotoUrl(String uid) {
    var senderDocumentSnapshot =
        Firestore.instance.collection('users').document(uid).get();
    return senderDocumentSnapshot;
  }

  Future<DocumentSnapshot> getReceiverPhotoUrl(String uid) {
    var receiverDocumentSnapshot =
        Firestore.instance.collection('users').document(uid).get();
    return receiverDocumentSnapshot;
  }

  Widget ChatMessagesListWidget() {
    print("SENDERUID : $_senderuid");
    return Flexible(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('messages')
            .document(_senderuid)
            .collection(widget.receiverUid)
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            listItem = snapshot.data.documents;
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) =>
                  chatMessageItem(snapshot.data.documents[index]),
              itemCount: snapshot.data.documents.length,
            );
          }
        },
      ),
    );
  }

  Widget chatMessageItem(DocumentSnapshot documentSnapshot) {
    return buildChatLayout(documentSnapshot);
  }

  Widget buildChatLayout(DocumentSnapshot snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: snapshot['senderUid'] == _senderuid?
            MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              snapshot['senderUid'] == _senderuid
                  ? CircleAvatar(
                      backgroundImage: senderPhotoUrl == null
                          ? AssetImage('assets/images/blankimage.png')
                          : NetworkImage(senderPhotoUrl),
                      radius: 20.0,
                    )
                  : CircleAvatar(
                      backgroundImage: receiverPhotoUrl == null
                          ? AssetImage('assets/images/blankimage.png')
                          : NetworkImage(receiverPhotoUrl),
                      radius: 20.0,
                    ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  snapshot['senderUid'] == _senderuid
                      ? new Text(
                          senderName == null ? "" : senderName,
                          style: TextStyle(
                              color: blackFixedTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        )
                      : new Text(
                          receiverName == null ? "" : receiverName,
                          style: TextStyle(
                              color: blackFixedTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                  snapshot['type'] == 'text'
                      ? new Text(
                          snapshot['message'],
                          style: TextStyle(color: blackFixedTextColor, fontSize: 14.0,),
                        )
                      : InkWell(
                          onTap: (() {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => FullScreenImage(photoUrl: snapshot['photoUrl']),
                              ),
                            );
                          }),
                          child: Hero(
                            tag: snapshot['photoUrl'],
                            child: FadeInImage(
                              image: NetworkImage(snapshot['photoUrl']),
                              placeholder: AssetImage('assets/images/blankimage.png'),
                              width: 200.0,
                              height: 200.0,
                            ),
                          ),
                      )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}