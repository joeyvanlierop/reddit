import 'package:draw/draw.dart';

class AccountManager {
  static final AccountManager _singleton = new AccountManager._internal();

  AccountManager._internal();

  factory AccountManager() {
    return _singleton;
  }

  Future registerAccount(String username, String password) async {
    final Reddit reddit = await Reddit.createInstalledFlowInstance();
  }
}
