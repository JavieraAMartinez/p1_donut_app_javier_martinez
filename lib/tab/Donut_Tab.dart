import 'package:flutter/material.dart';
import 'package:p1_donut_app_javier_martinez/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  //list of donuts
  final List donutsOnSale = [
// [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Javi", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Angie", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Pablo", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Tapatío", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;

  DonutTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.9),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                // Añadir al carrito al hacer tap
                String name = donutsOnSale[index][0];
                double price = double.parse(donutsOnSale[index][1]);
                addToCart(name, price);
              },
              child: DonutTile(
                donutFlavor: donutsOnSale[index][0],
                donutPrice: donutsOnSale[index][1],
                donutColor: donutsOnSale[index][2],
                imageName: donutsOnSale[index][3],
              ),
            ),
            //botines
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //eliminr
                GestureDetector(
                  onTap: () {
                    String name = donutsOnSale[index][0];
                    double price = double.parse(donutsOnSale[index][1]);
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
                //añadir
                GestureDetector(
                  onTap: () {
                    String name = donutsOnSale[index][0];
                    double price = double.parse(donutsOnSale[index][1]);
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
