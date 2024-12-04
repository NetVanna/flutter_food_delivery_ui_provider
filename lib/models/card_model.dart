import 'package:food_delivery/models/product_model.dart';

class CardModel {
  final ProductModel productModel;
  int quantity;

  CardModel({required this.productModel, required this.quantity});
}
