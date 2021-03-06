import 'dart:convert';

import 'package:email_app/compose_button.dart';
import 'package:email_app/message.dart';
import 'package:email_app/message_compose.dart';
import 'package:email_app/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;

  // Future loadMessageList() async {
  //   List<Message> _messages = await Message.browse();

  //   setState(() {
  //     messages = _messages;
  //   });
  // }

  void initState() {
    super.initState();
    messages = Message.browse();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              var _messages = Message.browse();
              setState(() {
                messages = _messages;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('There was an error: ${snapshot.error}');
              }
              var messages = snapshot.data;

              return ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return ListTile(
                    title: Text(message.subject),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text('M'),
                    ),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MessageDetail(message.subject, message.body);
                      }));
                    },
                  );
                },
              );
          }
          return null; // don't know it'll work or not, progress indicator would be better, container
        },
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
// _MessageListState
