import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_model.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/views/cart.dart';
import 'package:food_delivery/widgets/food_product_items.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/card_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String category = "";
  List<ProductModel> productModel = [];

  void filterProductByCategory(String selectedCategory) {
    setState(() {
      category = selectedCategory;
      productModel = myProductModel
          .where(
            (element) =>
                element.category.toLowerCase() ==
                selectedCategory.toLowerCase(),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    if (myCategories.isNotEmpty) {
      category = myCategories[0].name;
      filterProductByCategory(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    CardProvider cardProvider = Provider.of<CardProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Your Location",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: kOrange,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Phnom Penh",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: kBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: kBlack,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cart(),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: kBlack,
                              ),
                            ),
                          ),
                          cardProvider.carts.isNotEmpty
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Cart(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        cardProvider.carts.length.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Text(
                "Let's finds the best food around you",
                style: TextStyle(
                  fontSize: 35,
                  letterSpacing: -.4,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Find by Category",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: kBlack),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    myCategories.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            filterProductByCategory(myCategories[index].name);
                          });
                        },
                        child: Container(
                          width: 95,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: category == myCategories[index].name
                                ? Border.all(
                                    width: 2.5,
                                    color: kOrange,
                                  )
                                : Border.all(color: Colors.white),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlack.withOpacity(0.4),
                                          offset: const Offset(0, 10),
                                          blurRadius: 12,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    myCategories[index].image,
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                myCategories[index].name,
                                style: const TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 25),
              Text(
                "Result (${productModel.length})",
                style: TextStyle(
                  color: kBlack.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  letterSpacing: -.2,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: productModel.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(left: 50, top: 50),
                        child: Text(
                          'No products available',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          ...List.generate(
                            productModel.length,
                            (index) {
                              return Padding(
                                padding: index == 0
                                    ? const EdgeInsets.only(left: 25, right: 25)
                                    : const EdgeInsets.only(right: 25),
                                child: FoodProductItems(
                                  productModel: productModel[index],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
