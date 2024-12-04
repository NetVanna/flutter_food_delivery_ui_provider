class OnBoardingModel {
  final String image, text1, text2;

  OnBoardingModel(
      {required this.image, required this.text1, required this.text2});
}

List<OnBoardingModel> onboards = [
  OnBoardingModel(
    image: "assets/images/onboard_1.png",
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
  OnBoardingModel(
    image: "assets/images/onboard_2.png",
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
  OnBoardingModel(
    image: "assets/images/onboard_3.png",
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
];
