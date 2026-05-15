// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodItem {
  final String id;
  final String name;
  final double price;
  final String imgUrl;
  final bool isFavorite;
  final String categoryId;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
    this.isFavorite = false,
    required this.categoryId,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    double? price,
    String? imgUrl,
    bool? isFavorite,
    String? categoryId,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    id: 'burger 1',
    name: "Beef Burger",
    price: 8.5,
    imgUrl:
        "https://www.pngplay.com/wp-content/uploads/14/Burger-King-Triple-Whopper-Transparent-File-2.png",
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 2',
    name: "Cheese Burger",
    price: 9,
    imgUrl:
        "https://www.pngplay.com/wp-content/uploads/1/Cheeseburger-PNG-1.png",
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 3',
    name: "Chicken Burger",
    price: 6.5,
    imgUrl:
        "https://www.pngplay.com/wp-content/uploads/15/Mcdonalds-Mcchicken-Burger-PNG-HD-Quality.png",
    categoryId: '1',
  ),
  FoodItem(
    id: 'pizza 1',
    name: "Chicken Pizza",
    price: 12,
    imgUrl:
        "https://www.pngplay.com/wp-content/uploads/2/Pizza-Transparent-Background.png",
    categoryId: '2',
  ),
  FoodItem(
    id: 'pasta 1',
    name: "Pasta",
    price: 7,
    imgUrl:
        "https://www.pngplay.com/wp-content/uploads/7/Noodles-No-Background.png",
    categoryId: '3',
  ),
];
