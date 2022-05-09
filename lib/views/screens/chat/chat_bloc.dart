import 'package:chattr/models/user.dart';
import 'package:chattr/utils/singleton/singleton.dart';

class ChatBloc {
  List<User> usersList = Singleton.instance.usersList;
  List<User> pendingUsersList = [];

  // filterUsersList() {
  //   for (var i = 0; i < usersList.length; i++) {
  //     if (usersList[i].isPending == true) {
  //       return pendingUsersList;
  //     } else {
  //       return usersList;
  //     }
  //   }
  // }
}
