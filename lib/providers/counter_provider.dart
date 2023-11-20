import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier{
  /// Initial Count
  int _count=1;
  /// getter
 get count=>_count;

/// Increment //
void increment(){
  _count++;
  notifyListeners();
}

  /// decrement //
  void decrement(){
  if(_count<=1){

  }else{
    _count--;
    notifyListeners();
  }
  }

}