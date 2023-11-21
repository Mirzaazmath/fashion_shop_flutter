import 'package:flutter/cupertino.dart';

import '../data/shirt_data.dart';

class AddToCartProvider extends ChangeNotifier{
  List<Shirt>_addtoCartList=[];

  get addtoCartList=>_addtoCartList;

  void removeProduct(var product){

    _addtoCartList.remove(product);
    notifyListeners();
  }

  void addProductToCart(var product){
    final bool _productIsInList =
    _addtoCartList.any((product) => product.id == product.id);
    if(_productIsInList){

    }else{
      _addtoCartList.add(product);


    }
    notifyListeners();

  }

}
