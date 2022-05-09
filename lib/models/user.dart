class User {
  String username;
  String message;
  String profilePic;
  int unreadMSG;
  bool isPending;

  User({
    required this.username,
    required this.message,
    required this.profilePic,
    required this.unreadMSG,
    required this.isPending,
  });
}
