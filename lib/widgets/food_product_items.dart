import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/provider/card_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class FoodProductItems extends StatelessWidget {
  const FoodProductItems({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 225,
          width: size.width / 2.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
        Container(
          height: 285,
          width: size.width / 2.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 10 * pi / 180,
                  child: SizedBox(
                    height: 160,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 10,
                                    blurRadius: 30),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          productModel.image,
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  productModel.name,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold, color: kBlack),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: kYellow,
                      size: 22,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      productModel.rate.toString(),
                      style: TextStyle(
                        color: kBlack.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kPink,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${productModel.distance}m",
                          style: TextStyle(
                              color: kBlack.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "\$${(productModel.price).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              cardProvider.addCart(productModel);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
