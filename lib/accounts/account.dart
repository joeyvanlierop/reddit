import 'package:draw/draw.dart';
import 'package:flutter/foundation.dart';

class Account {
  Reddit reddit;
  String credentials;
  String nickname;

  Account({
    @required this.reddit,
    this.credentials,
    this.nickname,
  });

//  Future<String> validate() async {
//    return await reddit.then((me) {
//      return me.displayName;
//    }).catchError((error) {
//      return error;
//    });
//  }

  Future<String> getDisplayName() async {
    return RedditorRef(this.reddit).displayName;
  }

  void save() {
    credentials = reddit.auth.credentials.toJson();
  }

  void restore() {
    reddit = Reddit.restoreInstalledAuthenticatedInstance(this.credentials);
  }
}
