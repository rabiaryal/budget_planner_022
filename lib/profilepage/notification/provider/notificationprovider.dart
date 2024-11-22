

import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  // Store the state of each notification setting individually
  bool _isEmailSwitched = false;
  bool _isSoundSwitched = false;
  bool _isPushSwitched = false;

  bool get isEmailSwitched => _isEmailSwitched;
  bool get isSoundSwitched => _isSoundSwitched;
  bool get isPushSwitched => _isPushSwitched;

  void onEmailSwitchChanged(bool value) {
    _isEmailSwitched = value;
    notifyListeners();
  }

  void onSoundSwitchChanged(bool value) {
    _isSoundSwitched = value;
    notifyListeners();
  }

  void onPushSwitchChanged(bool value) {
    _isPushSwitched = value;
    notifyListeners();
  }
}

