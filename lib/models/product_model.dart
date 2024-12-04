class ProductModel {
  final String image, name, category;
  final double price, rate, distance;

  ProductModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.rate,
    required this.distance,
  });
}

List<ProductModel> myProductModel = [
  ProductModel(
    image: "assets/images/ramen/sapporo_miso_ramen.png",
    name: "Sapporo Miso",
    category: "Ramen",
    price: 3.9,
    rate: 5,
    distance: 150,
  ),
  ProductModel(
    image: "assets/images/ramen/kurume_ramen.png",
    name: "Kurume Ramen",
    category: "Ramen",
    price: 4.3,
    rate: 4.9,
    distance: 600,
  ),
  ProductModel(
    image: "assets/images/ramen/hakata_ramen.png",
    name: "Hakata Ramen",
    category: "Ramen",
    price: 3.9,
    rate: 4.8,
    distance: 400,
  ),
  ProductModel(
    image: "assets/images/ramen/sapporo_miso_ramen.png",
    name: "Sapporo Miso",
    category: "Ramen",
    price: 3.9,
    rate: 5,
    distance: 150,
  ),
  ProductModel(
    image: "assets/images/ramen/shrimp_fried_rice.png",
    name: "Shrimp Fried Rice",
    category: "Ramen",
    price: 4.9,
    rate: 4.5,
    distance: 800,
  ),
  ProductModel(
    image: "assets/images/ramen/fullset_ramen.png",
    name: "Fullset Ramen",
    category: "Ramen",
    price: 5.9,
    rate: 5,
    distance: 400,
  ),
];
