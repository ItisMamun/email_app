import 'package:flutter/material.dart';

import 'messages_list.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MessagesList(title: 'Email App'),
    );
  }
}
