import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final subject;
  final body;

  MessageDetail(this.subject, this.body);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(this.body),
      ),
    );
  }
}
