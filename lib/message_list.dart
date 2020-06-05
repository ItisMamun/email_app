import 'dart:convert';

import 'package:email_app/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({this.title});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];
  Future loadMessageList() async {
    // here we are using async await because of late latency and it's huge for computer.
    // we are using load string from rootBundle object for making that json to string.
    String content = await rootBundle.loadString('data/messages.json');
    // and we are decoding that string data to List data by performing json.decode method.
    List<Messages> collection = json.decode(content);
    // setState is used for saying flutter that this state should exist. Like the enter button to say
    // the computer that we want certain action to perform.
    setState(() {
      // here we are assining the json data from collection to the empty list of messages so that it can
      // show the messages to the screen , and its showing in the below ListTile widget.
      // we are making a separate json data file and accessing it with decoding it.
      messages = collection;
    });
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

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
          Messages message = messages[index];
          return ListTile(
            title: Text(message.subject),
            subtitle: Text(
              message.body,
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
