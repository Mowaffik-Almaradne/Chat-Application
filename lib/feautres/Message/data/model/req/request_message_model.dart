import 'dart:convert';

String messageRequestToJson(MessageRequest data) {
  return json.encode(data.toJson());
}

class MessageRequest {
  MessageRequest({
    required this.recipientId,
    required this.who,
    required this.message,
    required this.time,
  });

  int recipientId;
  int who;
  String message;
  DateTime? time;

  Map<String, dynamic> toJson() => {
        "recipientId": recipientId,
        "who": who,
        "message": message,
        "time": time?.toIso8601String(),
      };
}
