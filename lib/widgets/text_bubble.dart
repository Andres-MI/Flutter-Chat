import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final String sender;
  const TextBubble({Key? key, required this.text, required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
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
