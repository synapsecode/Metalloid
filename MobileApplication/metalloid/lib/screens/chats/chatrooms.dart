import 'package:flutter/material.dart';
import 'package:metalloid/screens/chats/savedchatrooms.dart';

class ChatRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: MySavedChatrooms(),
        )
    );
  }
}