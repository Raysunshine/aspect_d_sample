class FlutterGroup {
  final String groupLeader;
  final int groupMemberCount;

  FlutterGroup({
    required this.groupLeader,
    required this.groupMemberCount,
  });

  // 必须实现toJson方法 or @JsonSerializable()注解
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["groupLeader"] = groupLeader;
    data["groupMemberCount"] = groupMemberCount;
    return data;
  }
}
