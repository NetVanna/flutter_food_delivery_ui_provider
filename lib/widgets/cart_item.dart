import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/card_model.dart';
import 'package:food_delivery/provider/card_provider.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 140,
      width: size.width / 1.2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            width: size.width - 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
            top: -5,
            left: 0,
            child: Transform.rotate(
              angle: 10 * pi / 180,
              child: SizedBox(
                width: 130,
                height: 130,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kBlack.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      cardModel.productModel.image,
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            right: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardModel.productModel.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: kBlack),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: kYellow,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          cardModel.productModel.rate.toString(),
                          style: TextStyle(
                            color: kBlack.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kPink,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text("${cardModel.productModel.distance}m")
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${(cardModel.productModel.price).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cardModel.quantity > 1) {
                              cardProvider
                                  .recuseQuantity(cardModel.productModel);
                            }
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: kBlack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          cardModel.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            cardProvider.addCart(cardModel.productModel);
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: kBlack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
