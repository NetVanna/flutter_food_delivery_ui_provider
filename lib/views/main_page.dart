import 'package:flutter/material.dart';
import 'package:food_delivery/models/bottom_icon_model.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/views/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final selectedPage = [
    const HomePage(),
    const Center(child: Text("Message Page")),
    const Center(child: Text("Explore")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      bottomNavigationBar: Container(
        height: 85,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              bottomIcons.length,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        currentPage == index
                            ? bottomIcons[index].selected
                            : bottomIcons[index].unSelected,
                        color: kBlack,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(
                          color: kBlack,
                          shape: BoxShape.circle,
                        ),
                        width: currentPage == index ? 7 : 0,
                        height: currentPage == index ? 7 : 0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: selectedPage[currentPage],
    );
  }
}
