class ProductData {
  final String name;
  final String image;
  final double price;

  ProductData({required this.name, required this.image, required this.price});
}

List<ProductData> productItems = [
  ProductData(
      name: "Ragi Broken",
      image:
          'https://media.istockphoto.com/id/1329972777/photo/selection-of-healthy-food.jpg?s=1024x1024&w=is&k=20&c=7CjfDgJEn1c7N-lbWCj9oIvg-TOWeKFM4tdnIhvC6zM=',
      price: 80.00),
  ProductData(
      name: "Redrice Broken",
      image:
          'https://media.istockphoto.com/id/1319902998/photo/magnesium.jpg?s=1024x1024&w=is&k=20&c=cZ9usLqa2p-h28DZY2XDn44lfvU68-qPyOuYA3KCGQ0=',
      price: 90.00),
  ProductData(
      name: " Panivarazhu Broken",
      image:
          'https://images.unsplash.com/photo-1546702005-7f8e5aeab4a6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 70.00),
];

class Ingredient {
  final String name;
  final String image;
  final String quantity;

  Ingredient({required this.name, required this.image, required this.quantity});
}

List<Ingredient> allIngredients = [
  Ingredient(
      name: "Blueberries",
      image: 'assets/images/ic_millet.png',
      quantity: '30g'),
  Ingredient(
      name: "Mangoes", image: 'assets/images/ic_millet.png', quantity: '50g'),
  Ingredient(
      name: "Honey", image: 'assets/images/ic_millet.png', quantity: '15g'),
  Ingredient(
      name: "Oranges", image: 'assets/images/ic_millet.png', quantity: '50g'),
];

List<Ingredient> moreIngredients = [
  Ingredient(
      name: "Maple Syrup",
      image: 'assets/images/ic_millet.png',
      quantity: '50g'),
  Ingredient(
      name: "Pancake Syrup",
      image: 'assets/images/ic_millet.png',
      quantity: '50g'),
  Ingredient(
      name: "Chocolate Syrup",
      image: 'assets/images/ic_millet.png',
      quantity: '50g'),
  Ingredient(
      name: "Pure Maple Syrup",
      image: 'assets/images/ic_millet.png',
      quantity: '50g'),
];
