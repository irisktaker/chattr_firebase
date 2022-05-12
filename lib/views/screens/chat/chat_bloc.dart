import 'package:chattr/models/user.dart';
import 'package:chattr/shared/utils/singleton/singleton.dart';

class ChatBloc {
  List<User> chattersList =
      Singleton.instance.usersList.where((e) => e.isPending == false).toList();

  List<User> pendingList =
      Singleton.instance.usersList.where((e) => e.isPending == true).toList();
}
