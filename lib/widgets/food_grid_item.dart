import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredFood;
  const FoodGridItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  Widget build(BuildContext context) {
    final sizeP = MediaQuery.of(context).size;
     final targetedIndex = food.indexOf(filteredFood[foodIndex]);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
          padding: EdgeInsets.all(sizeP.height * .018),
          child: LayoutBuilder(
            builder: (context, constraints) => Column(children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    filteredFood[foodIndex].imgUrl,
                    height: constraints.maxHeight * .665,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FavoriteButton(
                        foodIndex: targetedIndex,
                        width: constraints.maxHeight * .2,
                        height: constraints.maxHeight * .2),
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight * .01),
              FittedBox(
                child: Text(
                  filteredFood[foodIndex].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: constraints.maxHeight * .115,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              // SizedBox(height: constraints.maxHeight * .0002),
              FittedBox(
                  child: Text(
                "\$${filteredFood[foodIndex].price}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: constraints.maxHeight * .10),
              )),
            ]),
          )),
    );
  }
}
