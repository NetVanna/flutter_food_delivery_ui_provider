import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/onboarding_model.dart';
import 'package:food_delivery/utils/constants.dart';

import 'main_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboards.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: -70,
                    left: 0,
                    right: 0,
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        onboards[index].image,
                        width: 600,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.9,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onboards[index].text1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              onboards[index].text2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 170,
            left: 20,
            child: FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  ...List.generate(
                    onboards.length,
                    (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 5,
                        width: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kOrange,
                        foregroundColor: Colors.white,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15)),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
