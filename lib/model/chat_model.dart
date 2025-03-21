class ChatModel {
  String name;
  String icon;
  String time;
  bool isGroup;
  String currentMessage;
  String status;

  ChatModel(
      {required this.name,
      required this.icon,
      required this.time,
      required this.isGroup,
      required this.currentMessage,
      required this.status});
}

class SelectModel {
  String name;
  String status;
  bool select = false;

  SelectModel({required this.name, required this.status, this.select = false});
}
