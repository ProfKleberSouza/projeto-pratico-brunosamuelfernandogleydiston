import 'package:doar_app/database/user_data.dart';

class Message {
  final User sender;
  final String time;
  // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}
