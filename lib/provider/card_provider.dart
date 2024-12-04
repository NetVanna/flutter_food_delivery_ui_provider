import 'package:flutter/material.dart';
import 'package:food_delivery/models/card_model.dart';
import 'package:food_delivery/models/product_model.dart';

class CardProvider with ChangeNotifier {
  /// private variable name _carts have type list
  /// store cart item represent by a cardModel
  List<CardModel> _carts = [];

  /// getter for _carts to access the list for cart item
  List<CardModel> get carts => _carts;

  set carts(List<CardModel> carts) {
    _carts = carts;
    notifyListeners(); // Notify any widget listen provider to rebuild
  }

  addCart(ProductModel productModel) {
    if (productExist(productModel)) {
      /// find index product in cart
      int index =
          _carts.indexWhere((element) => element.productModel == productModel);
      _carts[index].quantity++;
    } else {
      _carts.add(CardModel(productModel: productModel, quantity: 1));
    }
    notifyListeners(); // use for update
  }

  addQuantity(ProductModel product) {
    int index = _carts.indexWhere((element) => element.productModel == product);
    _carts[index].quantity++;
    notifyListeners();
  }

  recuseQuantity(ProductModel product) {
    int index = _carts.indexWhere((element) => element.productModel == product);
    _carts[index].quantity--;
    notifyListeners();
  }

  /// check product is exist
  /// if exist return true
  productExist(ProductModel productModel) {
    if (_carts.indexWhere((element) => element.productModel == productModel) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  // calculate the total price of all item in the cart
  double totalCart() {
    double total = 0;
    for(var i = 0 ; i<_carts.length;i++){
      total = total + _carts[i].quantity*_carts[i].productModel.price;
    }
    return total;
  }
}
