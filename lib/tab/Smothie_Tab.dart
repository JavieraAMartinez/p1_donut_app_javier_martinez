import 'package:flutter/material.dart';
import '../utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  final List smoothieOnSale = [
    ["Peaches Smoothie", "70", Colors.red, "lib/images/Peaches_smoothie.png"],
    [
      "Blueberry Smoothie",
      "60",
      Colors.red,
      "lib/images/blueberry_smoothie.png"
    ],
    ["Cherry Smoothie", "70", Colors.green, "lib/images/cherry-smoothie.png"],
    ["Mango Smoothie", "70", Colors.brown, "lib/images/mango_smoothie.png"],
    ["Orange Smoothie", "79", Colors.orange, "lib/images/orange_smoothie.png"],
    ["Green Smoothie", "80", Colors.green, "lib/images/green_smoothie.png"],
    [
      "Strawberry Smoothie",
      "85",
      Colors.pink,
      "lib/images/strawberry_smoothie.png"
    ],
    ["Colada Smoothie", "90", Colors.amber, "lib/images/colada_smoothie.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;

  SmoothieTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothieOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                //add
                String name = smoothieOnSale[index][0];
                double price = double.parse(smoothieOnSale[index][1]);
                addToCart(name, price);
              },
              child: SmoothieTile(
                smoothieFlavor: smoothieOnSale[index][0],
                smoothiePrice: smoothieOnSale[index][1],
                smoothieColor: smoothieOnSale[index][2],
                imageName: smoothieOnSale[index][3],
              ),
            ),
            //add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //delete
                GestureDetector(
                  onTap: () {
                    String name = smoothieOnSale[index][0];
                    double price = double.parse(smoothieOnSale[index][1]);
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
                    String name = smoothieOnSale[index][0];
                    double price = double.parse(smoothieOnSale[index][1]);
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
