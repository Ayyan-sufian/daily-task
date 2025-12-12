import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  var firstName = 'Ayan';

  var secName = 'Sufian';

  var fullName = '';

  void userName () {
    fullName = firstName + secName;
  }
}