import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          InkWell(
              onTap: decrementCounter,
              child: Text(
                "-",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: counter > 1 ? Colors.black : Colors.grey,
                      fontSize: 44,
                    ),
              )),
          const SizedBox(width: 16),
          Text(counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrangeAccent,
                  )),
          const SizedBox(width: 16),
          InkWell(
              onTap: incrementCounter,
              child: Text(
                "+",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 44,
                    ),
              )),
        ]),
      ),
    );
  }
}
