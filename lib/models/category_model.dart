class CategoryModel {
  final String image, name;

  CategoryModel({required this.image, required this.name});
}

List<CategoryModel> myCategories = [
  CategoryModel(
    image: "assets/images/ramen.png",
    name: "Ramen",
  ),
  CategoryModel(
    image: "assets/images/burger.png",
    name: "Burger",
  ),
  CategoryModel(
    image: "assets/images/salad.png",
    name: "Salad",
  ),
  CategoryModel(
    image: "assets/images/pancake.png",
    name: "Pancake",
  ),
];
