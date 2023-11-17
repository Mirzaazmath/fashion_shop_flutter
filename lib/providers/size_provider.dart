import 'package:flutter/cupertino.dart';


class SizeProvider extends ChangeNotifier{
  String _size="M";

  get size=>_size;

  void updateSize(String val){
    _size=val;
    notifyListeners();
  }

}