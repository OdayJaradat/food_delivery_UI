// ignore: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_asstets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryChosenId;
  bool enableCatergoryFilter = false;
  late List<FoodItem> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height * .015),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                height: size.height * .23,
                fit: BoxFit.fill,
                AppAsstets.burgerBanner,
              ),
            ),
            SizedBox(height: size.height * .03),
            SizedBox(
              height: size.height * .145,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (categoryChosenId == categories[index].id ||
                            !enableCatergoryFilter) {
                          enableCatergoryFilter = !enableCatergoryFilter;
                        }
                        if (enableCatergoryFilter) {
                          categoryChosenId = categories[index].id;
                          filteredFood = food
                              .where(
                                  (item) => item.categoryId == categoryChosenId)
                              .toList();
                        } else {
                          categoryChosenId = null;
                          filteredFood = food;
                        }
                      });
                    },
                    child: Container(
                      width: size.width * .22,
                      decoration: BoxDecoration(
                        color: categoryChosenId == categories[index].id
                            ? Colors.deepOrangeAccent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(children: [
                          Image.asset(categories[index].imgPath),
                          const SizedBox(height: 2),
                          Text(
                            categories[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color:
                                      categoryChosenId == categories[index].id
                                          ? Colors.white
                                          : null,
                                ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * .02),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: size.height * .022,
                crossAxisSpacing: size.height * .022,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    final targetedFoodItem = food.firstWhere(
                        (item) => item.id == filteredFood[index].id);
                    final targetedIndex = food.indexOf(targetedFoodItem);
                    Navigator.of(context)
                        .pushNamed(
                      FoodDetailsPage.routeName,
                      arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                    )
                        .then((value) {
                      setState(() {});
                      filteredFood = food;
                      categoryChosenId = null;
                      debugPrint("the value returned in home page is: $value");
                    });
                  },
                  child: FoodGridItem(
                      foodIndex: index, filteredFood: filteredFood)),
            )
          ],
        ),
      ),
    );
  }
}
