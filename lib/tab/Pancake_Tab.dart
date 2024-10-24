import 'package:flutter/material.dart';

import '../utils/pancakes_tile.dart';

class PanCakeTab extends StatelessWidget {
  final List pancakesOnSale = [
    ["Original Pancake", "80", Colors.red, "lib/images/original_pancake.png"],
    ["Blueberry Pancake", "98", Colors.red, "lib/images/blueberry_pancake.png"],
    ["Moka Pancake", "85", Colors.green, "lib/images/moka_pancake.png"],
    ["Egg Pancake", "85", Colors.brown, "lib/images/egg_pancake.png"],
    [
      "Strawberry Pancake",
      "80",
      Colors.orange,
      "lib/images/strawberry_pancake.png"
    ],
    ["Regular Pancake", "89", Colors.green, "lib/images/regular_pancake.png"],
    ["Honey Pancake", "98", Colors.pink, "lib/images/honey_pancake.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;

  PanCakeTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                //add
                String name = pancakesOnSale[index][0];
                double price = double.parse(pancakesOnSale[index][1]);
                addToCart(name, price);
              },
              child: PancakesTile(
                pancakesFlavor: pancakesOnSale[index][0],
                pancakesPrice: pancakesOnSale[index][1],
                pancakesColor: pancakesOnSale[index][2],
                imageName: pancakesOnSale[index][3],
              ),
            ),
            //add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //delete
                GestureDetector(
                  onTap: () {
                    String name = pancakesOnSale[index][0];
                    double price = double.parse(pancakesOnSale[index][1]);
                    removeFromCart(name, price);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                ),
                //add botton
                GestureDetector(
                  onTap: () {
                    String name = pancakesOnSale[index][0];
                    double price = double.parse(pancakesOnSale[index][1]);
                    addToCart(name, price);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.pink,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
