class RecentCalls {
  String profilePic;
  String username;
  String date;
  int missedCall;
  bool incomingCall;
  bool videoCall ;

  RecentCalls({
    required this.profilePic,
    required this.username,
    required this.date,
    required this.missedCall,
    required this.incomingCall,
     this.videoCall = false,
  });
}
