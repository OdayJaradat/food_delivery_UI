import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_asstets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
  
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final sizeP = MediaQuery.of(context).size;
    final favoriteFood =
        food.where((foodItem) => foodItem.isFavorite == true).toList();
    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              AppAsstets.emptyState,
              height: sizeP.height * .475,
            ),
            Text('You didn\'t add any item yet!',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(sizeP.height * .012),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            int targetIndex = food.indexOf(favoriteFood[index]);
            Navigator.of(context)
                .pushNamed(
              FoodDetailsPage.routeName,
              arguments: FoodDetailsArgs(foodIndex: targetIndex),
            )
                .then(
              (value) {
                setState(() {});
                debugPrint("the value returned in favorite page is: $value");
              },
            );
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(sizeP.height * .018),
              child: Row(children: [
                Image.network(
                  favoriteFood[index].imgUrl,
                  height: sizeP.height * .115,
                  width: sizeP.height * .125,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: sizeP.height * .0135),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoriteFood[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: sizeP.height * .005),
                      Text(
                        '\$ ${favoriteFood[index].price}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      final targetedItem = favoriteFood[index];
                      int targetedIndex = food.indexOf(targetedItem);
                      setState(() {
                        food[targetedIndex] =
                            food[targetedIndex].copyWith(isFavorite: false);
                        favoriteFood.remove(targetedItem);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.deepOrange,
                      size: sizeP.height * .04,
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
