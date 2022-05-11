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
    this.isPending = false,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      message: json['message'],
      profilePic: json['profilePic'],
      unreadMSG: json['unreadMSG'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'message': message,
      'profilePic': profilePic,
      'unreadMSG': unreadMSG,
    };
  }
}
