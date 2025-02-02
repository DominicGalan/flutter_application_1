import 'package:flutter/material.dart';
import 'package:flutter_application_1/message_list.dart';

class MessageContainer extends StatelessWidget {
  final MessageListDesc message;
  final VoidCallback delete;
  const MessageContainer({
    super.key, required this.message, required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: message.image.startsWith("http")
                      ? NetworkImage(message.image)
                      : AssetImage(message.image) as ImageProvider,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${message.name}", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'RobotoCondensed', fontSize: 17)),
                  Text("D: ${message.date}", style: TextStyle(fontFamily: 'RobotoCondensed', color: Colors.grey[700])),
                  Text("M: ${message.message}", style: TextStyle(fontFamily: 'RobotoCondensed')),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: IconButton(
                onPressed: delete, icon: Icon(Icons.delete),
                style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.red)
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  static void remove(MessageListDesc message) {}
}