import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/text_bubble.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs.reversed;
          List<TextBubble> messageBubbles = [];
          for (var message in messages!) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            final currentUser = FirebaseAuth.instance.currentUser?.email;
            final messageBubble =
                TextBubble(text: messageText, sender: messageSender, isAuthor: currentUser == messageSender,);
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        });
  }
}
