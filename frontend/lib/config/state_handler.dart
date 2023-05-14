import 'package:flutter/widgets.dart';

class StateHandler extends ChangeNotifier {
  dynamic userdata;
  static Future<StateHandler> initStateHandler() async {
    final handler = StateHandler();
    return handler;
  }

  Future<void> setuserdata(dynamic data) async {
    userdata = data;
    notifyListeners();
  }
}
