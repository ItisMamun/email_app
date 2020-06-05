import 'package:flutter/material.dart';

class MessagesList extends StatefulWidget {
  final String title;
  MessagesList({this.title});

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];
          return ListTile(
            title: Text(message['subject']),
            subtitle: Text(
              message['body'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
              child: Text('M'),
            ),
          );
        },
      ),
    );
  }
}
