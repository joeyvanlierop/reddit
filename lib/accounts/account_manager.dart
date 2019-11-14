import 'package:draw/draw.dart';
import 'package:reddit/accounts/account.dart';

import 'account.dart';

final List<String> scope = [
  'identity',
  'edit',
  'flair',
  'history',
  'mysubreddits',
  'privatemessages',
  'read',
  'report',
  'save',
  'submit',
  'subscribe',
  'vote',
  'wikiread',
];

// TODO: Will probably have to implement my own timeout function with a Future<loggedIn> and make my current user a Future thingy
//final initialized = await reddit._initializedCompleter.future;
//if (initialized) {
//  return reddit;
//}
class AccountManager {
  static AccountManager _singleton;
  Account _currentAccount;

  static AccountManager getInstance() {
    if (_singleton == null) {
      _singleton = AccountManager._internal();
    }

    return _singleton;
  }

  AccountManager._internal();

  Future<Account> currentAccount() async {
    if (_currentAccount == null) {
      await _createReadOnly().then((readOnlyAccount) {
        changeAccount(readOnlyAccount);
      }).catchError((e) {
        return e;
      }).timeout(
        const Duration(seconds: 20),
      );
    }

    return _currentAccount;
  }

  Account changeAccount(Account account) {
    _currentAccount = account;
    return _currentAccount;
  }

  Future<Account> _createReadOnly() async {
    return Account(
      reddit: await Reddit.createUntrustedReadOnlyInstance(
        clientId: 'GGkEILtme1YcQA',
        deviceId: 'sYbVcAcuOnXoyliTEprL',
        userAgent: 'android:flutter:0.0.2 (by /u/banana_shavings)',
      ).then(
        (readOnly) {
          return readOnly;
        },
      ).catchError(
        (error) {
          return Future.error(error);
        },
      ),
    );
  }

  Future<Reddit> authorizeAccount() async {
    final Reddit reddit = Reddit.createInstalledFlowInstance(
      clientId: 'GGkEILtme1YcQA',
      userAgent: 'android:flutter:0.0.2 (by /u/banana_shavings)',
      redirectUri: Uri.parse('http://localhost:8080'),
    );

//    final authUrl = reddit.auth.url(scope, 'flutter');

    await reddit.auth.authorize('kf5rUppgly6EV4BjIdMe1b--Oaw');

    return reddit;
  }

  void restoreAccount(String credentials) {
    Reddit reddit = Reddit.restoreInstalledAuthenticatedInstance(credentials);

    registerAccount(reddit);
  }

  void registerAccount(Reddit reddit) {
    Account account = Account(
      reddit: reddit,
    );

    //TODO: SAVE TO DATABSE
    _currentAccount = account;
  }
}
