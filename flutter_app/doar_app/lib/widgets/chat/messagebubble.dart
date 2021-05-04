import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String _message;
  final bool _isMe;
  final Key key;
  final String _username;
  final String _avatar;

  MessageBubble(this._username, this._message, this._avatar, this._isMe,
      {required this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    _isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: _isMe ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      _isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: (MediaQuery.of(context).size.width) / 1.90,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 9,
              ),
              child: Column(
                crossAxisAlignment: this._isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    this._username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isMe
                            ? Colors.black87
                            : Theme.of(context)
                                .accentTextTheme
                                .headline6!
                                .color),
                  ),
                  Text(
                    _message,
                    style: TextStyle(
                        color: _isMe
                            ? Colors.black87
                            : Theme.of(context)
                                .accentTextTheme
                                .headline6!
                                .color),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          right: _isMe ? 0 : 80,
          left: _isMe ? 80 : 0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(_avatar),
          ),
        ),
      ],
    );
  }
}
