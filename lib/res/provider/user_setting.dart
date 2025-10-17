import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings extends ChangeNotifier{
  double _fontRatio = 2;
  double get fontRatio{
    return _fontRatio;
  }
  double get fontSize{
    developer.log('_fontRatio: $_fontRatio', name: 'UserSettings');
    return 13 + _fontRatio;
  }
  set fontRatio(double value){
     _fontRatio = value;
     notifyListeners();
  }
  String _ring = "assets/ring/default.mp3";
  String get ring {
    return _ring;
  }
  set ring(String value){
    _ring = value;
    notifyListeners();
  }
  String _notify = "assets/notify_sound/default.mp3";
  String get notifySound{
    return _notify;
  }
  set notifySound(String value){
    _notify = value;
    notifyListeners();
  }

  String _chatBgFilePath = "";
  String get chatBgFilePath{
    return  _chatBgFilePath;
  }
  set chatBgFilePath(String value){
    _chatBgFilePath = value;
    notifyListeners();
  }

  bool _showMessageInChat = false;
  bool get showMessageInChat{
    return _showMessageInChat;
  }
  set showMessageInChat(bool value){
    _showMessageInChat = value;
    notifyListeners();
  }

  bool _showCallInChat = false;
  bool get showCallInChat {
    return _showCallInChat;
  }
  set showCallInChat(bool value){
    _showCallInChat = value;
    notifyListeners();
  }

  load(String userId)async{
    developer.log('get:$userId', name: 'UserSettings');
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? value = sp.getString("${userId}_settings");
    developer.log('get:$value', name: 'UserSettings');
    if(value == null){
      return;
    }
    var obj = const JsonDecoder().convert(value);
    if(obj is Map){
      fontRatio = obj["fontRatio"]??2;
      chatBgFilePath = obj["chatBgFilePath"]??"";
      notifySound = obj["notify"]??"";
      ring = obj["ring"]??"";
      showCallInChat = obj["showCallInChat"]??false;
      showMessageInChat = obj["showMessageInChat"]??false;
      notifyListeners();
    }
  }
  save(String userId)async{
    developer.log('save:$userId', name: 'UserSettings');
    SharedPreferences sp = await SharedPreferences.getInstance();
    var obj = {};
    obj["fontRatio"] =  fontRatio;
    obj["chatBgFilePath"]= chatBgFilePath;
    obj["notify"] = notifySound ;
    obj["ring"]  =  ring;
    obj["showCallInChat"] = showCallInChat;
    obj["showMessageInChat"] = showMessageInChat;
    String value = const JsonEncoder().convert(obj);
    await sp.setString("${userId}_settings", value);
    developer.log('save:$value', name: 'UserSettings');

  }
}
