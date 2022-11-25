import 'package:flutter/material.dart';

class ListModel extends ChangeNotifier {
  final List _list = [];
  List get list => _list;
  imageUpload() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    _list.add("Slow update after 3 sec");
    notifyListeners();
  }

  dataUpload(String text) async {
    await Future.delayed(const Duration(seconds: 1), () {
      _list.add(text);
    });
    notifyListeners();
  }
}
