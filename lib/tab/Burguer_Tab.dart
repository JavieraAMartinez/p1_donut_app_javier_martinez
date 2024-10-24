import 'package:flutter/material.dart';
import 'package:p1_donut_app_javier_martinez/utils/burguer_tile.dart';

class BurgerTab extends StatelessWidget {
  final List burgersOnSale = [
    ["Double Burger", "70", Colors.red, "lib/images/double_burger.png"],
    ["Vegan Mix Burger", "98", Colors.red, "lib/images/vegan_mix_burger.png"],
    ["Monster Burger", "85", Colors.green, "lib/images/monster_burger.png"],
    ["Veggie Burger", "95", Colors.brown, "lib/images/veggie_burger.png"],
    ["Bacon Burger", "70", Colors.orange, "lib/images/bacon_burger.png"],
    ["Cheese Burger", "69", Colors.green, "lib/images/cheese_burger.png"],
    ["Beef Burger", "78", Colors.pink, "lib/images/beef_burger.png"],
    ["Guacamole Burger", "88", Colors.amber, "lib/images/guacamole_burger.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;

  BurgerTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                //add
                String name = burgersOnSale[index][0];
                double price = double.parse(burgersOnSale[index][1]);
                addToCart(name, price);
              },
              child: BurgerTile(
                burgerFlavor: burgersOnSale[index][0],
                burgerPrice: burgersOnSale[index][1],
                burgerColor: burgersOnSale[index][2],
                imageName: burgersOnSale[index][3],
              ),
            ),
            //add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //delete
                GestureDetector(
                  onTap: () {
                    String name = burgersOnSale[index][0];
                    double price = double.parse(burgersOnSale[index][1]);
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
                    String name = burgersOnSale[index][0];
                    double price = double.parse(burgersOnSale[index][1]);
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
