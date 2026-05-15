import 'package:food_delivery/utilities/app_asstets.dart';

class CategoryItem {
  final String id;
  final String title;
  final String imgPath;

  CategoryItem({
    required this.id,
    required this.title,
    required this.imgPath,
  });
}

final List<CategoryItem> categories = [
  CategoryItem(id: '1', title: 'burger', imgPath: AppAsstets.burgerIcon),
  CategoryItem(id: '2', title: 'pizza', imgPath: AppAsstets.pizzaIcon),
  CategoryItem(id: '3', title: 'pasta', imgPath: AppAsstets.pastaIcon),

];
