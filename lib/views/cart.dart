import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/card_model.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/widgets/cart_item.dart';
import 'package:provider/provider.dart';

import '../provider/card_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    List<CardModel> cartsItems = cardProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      cartsItems.length,
                      (index) {
                        return Container(
                          height: 145,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            top: index == 0 ? 30 : 0,
                            right: 25,
                            left: 25,
                            bottom: 30,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              FadeInUp(
                                delay:
                                    Duration(milliseconds: (index + 1) * 200),
                                child: CartItem(
                                  cardModel: cartsItems[index],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Delivery",
                        style: TextStyle(
                          fontSize: 20,
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DottedLine(
                          dashLength: 10,
                          dashColor: kBlack.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(),
                      const Text(
                        "\$5.99",
                        style: TextStyle(
                          color: kOrange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        "Total Order",
                        style: TextStyle(
                          fontSize: 20,
                          color: kBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: DottedLine(
                          dashLength: 10,
                          dashColor: kBlack.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(),
                      Text(
                        "\$${(cardProvider.totalCart()).toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: kOrange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 75,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBlack,
                        foregroundColor: Colors.white,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      child: Text(
                        "Pay \$${(cardProvider.totalCart()+5.99).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
