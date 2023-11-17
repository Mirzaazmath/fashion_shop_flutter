import 'package:flutter/cupertino.dart';


class CategoryProvider extends ChangeNotifier{
  int _index=1;

  get index=>_index;

  void updateCategory(int val){
    _index=val;
    notifyListeners();
  }

}