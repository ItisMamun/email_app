class Message {
  final subject;
  final body;

  Message(this.subject, this.body);
  // this constructor will tell dart , if you get a Map, here's the instruction to make it a message
  // here's Map<String because Map it can hold key of String and int
  Message.fromJson(Map<String, dynamic> json)
      // take the key of subject and assign it to subject(above)
      : subject = json['subject'],
        // same
        body = json['body'];
}

// yooooooo made it, it's showing on the screen
