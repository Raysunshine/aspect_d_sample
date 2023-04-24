class MessageAction {
  MessageAction({
    required this.action,
  });

  final MessageAction action;
}

enum MessageActionType {
  navigateWithArguments,
  plusCountValue,
}
