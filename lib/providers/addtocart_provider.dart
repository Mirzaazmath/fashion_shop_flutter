import 'package:flutter/cupertino.dart';

import '../data/shirt_data.dart';

class AddToCartProvider extends ChangeNotifier{
  List<Shirt>_addtoCartList=[];

  get addtoCartList=>_addtoCartList;

  void addProductToCart(var product){
    if(_addtoCartList.contains(product)){

    }else{
      _addtoCartList.add(product);


    }
    notifyListeners();

  }

}
