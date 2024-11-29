

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@singleton
class AppConfigProvider extends ChangeNotifier{
  String _token ="";


  set token(String value) {
    _token = value;
    notifyListeners();
  }

  String get token => _token;
}