import 'package:daily_task/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier{
  UserProvider? userProvider;
  String fullName = '';
  bool isSwapped = false;


  int count = 0;

  void updateName(UserProvider user) {
    userProvider = user;
    notifyListeners();
  }
  void increment() {
    count++;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
  void name() {
    if (userProvider == null) return;

    fullName = '${userProvider?.firstName} ${userProvider?.secName}';
    notifyListeners();
  }

  void swapOption () {
   isSwapped = !isSwapped;
    notifyListeners();
  }
}