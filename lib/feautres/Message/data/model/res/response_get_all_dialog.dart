class ResponseDialogMessage {
  ResponseDialogMessage({
    required this.result,
  });

  final DailogResult result;

  factory ResponseDialogMessage.fromJson(Map<String, dynamic> json) {
    return ResponseDialogMessage(
        result: DailogResult.fromJson(json["result"] ?? {}));
  }
}

class DailogResult {
  DailogResult({
    required this.id,
    required this.dialogs,
  });

  final String id;
  final List<DialogMessageInfoPartener> dialogs;

  factory DailogResult.fromJson(Map<String, dynamic> json) {
    return DailogResult(
      id: json["id"] ?? "",
      dialogs: json["dialogs"] == null
          ? []
          : List<DialogMessageInfoPartener>.from(json["dialogs"]!
              .map((x) => DialogMessageInfoPartener.fromJson(x))),
    );
  }
}

//! information dialog message
class DialogMessageInfoPartener {
  DialogMessageInfoPartener({
    required this.who,
    required this.message,
    required this.chatid,
    required this.time,
    required this.id,
  });

  final int who;
  final String message;
  final String chatid;
  final DateTime? time;
  final int id;

  factory DialogMessageInfoPartener.fromJson(Map<String, dynamic> json) {
    return DialogMessageInfoPartener(
      who: json["who"] ?? 0,
      message: json["message"] ?? "",
      chatid: json["chatid"] ?? "",
      time: DateTime.tryParse(json["time"] ?? ""),
      id: json["id"] ?? 0,
    );
  }
}
