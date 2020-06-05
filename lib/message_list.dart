import 'dart:convert';

import 'package:email_app/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];
  Future loadMessageList() async {
    // here we are using async await because of late latency and it's huge for computer.
    // we are using load string from rootBundle object for making that json to string.
    String content = await rootBundle.loadString('data/message.json');
    // and we are decoding that string data to List data by performing json.decode method.
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    // [1,2,3,4].map((el) => el+1) --> [2,3,4,5]
    // setState is used for saying flutter that this state should exist. Like the enter button to say
    // the computer that we want certain action to perform.
    setState(() {
      // here we are assining the json data from collection to the empty list of messages so that it can
      // show the messages to the screen , and its showing in the below ListTile widget.
      // we are making a separate json data file and accessing it with decoding it.
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
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
          );
        },
      ),
    );
  }
}
// _MessageListState
