import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isAuthor;
  const TextBubble(
      {Key? key,
      required this.text,
      required this.sender,
      required this.isAuthor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isAuthor ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isAuthor ? 30.0 : 0.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topRight: Radius.circular(isAuthor ? 0.0 : 30.0)),
            elevation: 5.0,
            color: isAuthor ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.0,
                    color: isAuthor ? Colors.white : Colors.black54),
              ),
            ),
          ),
          Text(
            sender,
            style: TextStyle(color: Colors.black54, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
