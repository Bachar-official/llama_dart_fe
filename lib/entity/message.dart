class Message {
  final String uuid;
  final bool sentByMe;
  String text;

  Message({required this.uuid, required this.sentByMe, required this.text});
}