import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgets/custom_back_button.dart';
import 'package:food_delivery/widgets/favorite_button.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';

//import 'package:food_delivery/widgets/food_details/top_banner.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});
  static const String routeName = '/food-details';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs foodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodIndex = foodArgs.foodIndex;
    return Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
      top: false,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomBackButton(
                    onTap: () =>
                        Navigator.of(context).pop<String>(food[foodIndex].name),
                    width: size.width * .09,
                    height: size.height * .0451,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FavoriteButton(
                        foodIndex: foodIndex,
                        width: size.width * .09,
                        height: size.height * .0451),
                  )
                ],
                expandedHeight: size.height * .47,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.network(
                          food[foodIndex].imgUrl,
                          fit: BoxFit.contain,
                          height: size.height * .35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                    left: size.width * .042,
                    right: size.width * .042,
                    top: size.height * .025,
                    bottom: size.height * .035),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(food[foodIndex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                      )),
                              SizedBox(height: size.height * .004),
                              Text("bufillo burger",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.blueGrey,
                                      )),
                            ]),
                        FoodItemCounter(),
                      ]),
                  SizedBox(height: size.height * 0.023),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PropertyItem(
                            propertyName: "Size", propertyValue: "Medium"),
                        VerticalDivider(indent: 0, endIndent: 0),
                        PropertyItem(
                            propertyName: "Cooking",
                            propertyValue: "10-20 Min"),
                        VerticalDivider(indent: 0, endIndent: 0),
                        PropertyItem(
                            propertyName: "Calories", propertyValue: "150 Cal"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .021,
                  ),
                  Text(
                    "lorem ipsum lorem ipsum lorem ipsum ipsum lorem ipsum lorem ipsum ipsum lorem ipsum lorem ipsum ipsum lorem ipsum lorem ipsum ipsum lorem ipsum lorem ipsum ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem lorem lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem lorem ipsum ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  )
                ])),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * .042,
            right: size.width * .042,
            top: size.height * .015,
            bottom: size.height * .015,
          ),
          child: Row(children: [
            Text("\$ ${food[foodIndex].price}",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                    )),
            SizedBox(width: size.width * .18),
            Expanded(
                child: SizedBox(
              height: size.height * .065,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Check Out",
                    style: TextStyle(fontSize: 23),
                  )),
            ))
          ]),
        ),
      ]),
    ));
  }
}
