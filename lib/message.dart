import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
// command --> flutter packages pub run build_runner build
part 'message.g.dart';

@JsonSerializable()
class Message {
  final subject;
  final body;

  Message(this.subject, this.body);
  // this constructor will tell dart , if you get a Map, here's the instruction to make it a message
  // here's Map<String because Map it can hold key of String and int
  // changes it to make less boiler code
  // Here factory says that it returns value from function
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  // take the key of subject and assign it to subject(above)
  // : subject = json['subject'],
  // same
  // body = json['body'];
  static Future<List<Message>> browse() async {
    http.Response response =
        await http.get('http://www.mocky.io/v2/5edb09d83200006f005d2666');
    await Future.delayed(Duration(seconds: 3));
    String content = response.body;

    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
