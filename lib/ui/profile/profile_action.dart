class ProfileAction {
  ProfileAction({
    required this.action,
  });

  final ProfileAction action;
}

enum ProfileActionType {
  navigateUpWithoutAnything,
  navigateUpWithArguments,
}
