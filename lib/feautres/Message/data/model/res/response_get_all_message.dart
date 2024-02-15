
class GetAllMessageResponse {
  GetAllMessageResponse({
    required this.result,
  });

  final List<DialogMessageInfo> result;

  factory GetAllMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetAllMessageResponse(
      result: json["result"] == null
          ? []
          : List<DialogMessageInfo>.from(
              json["result"]!.map((x) => DialogMessageInfo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class DialogMessageInfo {
  DialogMessageInfo({
    required this.id,
    required this.accountId,
    required this.fullName,
    required this.contactId,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.dialogs,
  });

  final String id;
  final int accountId;
  final String fullName;
  final int contactId;
  final String lastMessage;
  final DateTime? lastMessageTime;
  final List<Dialog> dialogs;

  factory DialogMessageInfo.fromJson(Map<String, dynamic> json) {
    return DialogMessageInfo(
      id: json["id"] ?? "",
      accountId: json["accountId"] ?? 0,
      fullName: json["fullName"] ?? "",
      contactId: json["contactId"] ?? 0,
      lastMessage: json["lastMessage"] ?? "",
      lastMessageTime: DateTime.tryParse(json["lastMessageTime"] ?? ""),
      dialogs: json["dialogs"] == null
          ? []
          : List<Dialog>.from(json["dialogs"]!.map((x) => Dialog.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "fullName": fullName,
        "contactId": contactId,
        "lastMessage": lastMessage,
        "lastMessageTime": lastMessageTime?.toIso8601String(),
        "dialogs": dialogs.map((x) => x.toJson()).toList(),
      };
}

class Dialog {
  Dialog({
    required this.who,
    required this.message,
    required this.chatid,
    required this.time,
    required this.id,
  });

  final num who;
  final String message;
  final String chatid;
  final DateTime? time;
  final int id;

  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      who: json["who"] ?? 0,
      message: json["message"] ?? "",
      chatid: json["chatid"] ?? "",
      time: DateTime.tryParse(json["time"] ?? ""),
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "who": who,
        "message": message,
        "chatid": chatid,
        "time": time?.toIso8601String(),
        "id": id,
      };
}
