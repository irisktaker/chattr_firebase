import 'package:chattr/models/user.dart';

class Singleton {
  Singleton();

  static final instance = Singleton();

  List<User> usersList = [
    User(
      username: "Dan Wells",
      message: "Have you sent the updated code files",
      profilePic:
          "https://images.unsplash.com/photo-1608155686393-8fdd966d784d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      unreadMSG: 2,
      isPending: true,
    ),
    User(
      username: "Nancy Wade",
      message: "You know this, right!",
      profilePic:
          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      unreadMSG: 1,
      isPending: true,
    ),
    User(
      username: "Beverly Grey",
      message: "You should have seen her face",
      profilePic:
          "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
      unreadMSG: 0,
    ),
    User(
      username: "Jan Dan",
      message: "Happy Coders",
      profilePic:
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      unreadMSG: 3,
    ),
    User(
      username: "Rebecca Young",
      message: "Let's go to swimming next week",
      profilePic:
          "https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80",
      unreadMSG: 1,
      isPending: true,
    ),
    User(
      username: "Lena Kar",
      message: "Nice to meet you",
      profilePic:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
      unreadMSG: 3,
    ),
    User(
      username: "Kali Linux",
      message: "Hackers ,,,",
      profilePic:
          "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      unreadMSG: 3,
    ),
    User(
      username: "Kara mara",
      message: "Silent World",
      profilePic:
          "https://images.unsplash.com/photo-1455274111113-575d080ce8cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
      unreadMSG: 4,
    ),
    User(
      username: "Martin",
      message: "Hello World",
      profilePic:
          "https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      unreadMSG: 0,
      isPending: true,
    ),
  ];
}
