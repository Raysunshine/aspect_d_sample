class HomeAction {
  HomeAction({
    required this.action,
  });

  final HomeActionType action;
}

enum HomeActionType {
  navigateWithArguments,
  plusCountValue,
  doSomething,
}
