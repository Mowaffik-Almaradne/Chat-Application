
class MessageResponse {
  MessageResponse({
    required this.result,
  });

  final ResponseMessageInfo result;

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      result: ResponseMessageInfo.fromJson(json["result"] ?? {}),
    );
  }
}

//! info Message :
class ResponseMessageInfo {
  ResponseMessageInfo({
    required this.recipientId,
    required this.who,
    required this.message,
    required this.time,
  });

  int recipientId;
  int who;
  String message;
  DateTime? time;

  factory ResponseMessageInfo.fromJson(Map<String, dynamic> json) {
    return ResponseMessageInfo(
      recipientId: json["recipientID"] ?? 0,
      who: json["who"] ?? 0,
      message: json["message"] ?? "",
      time: DateTime.tryParse(json["time"] ?? ""),
    );
  }
}
