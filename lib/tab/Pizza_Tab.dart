import 'package:flutter/material.dart';
import '../utils/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final List pizzaOnSale = [
    ["Meat Pizza", "80", Colors.red, "lib/images/meat_pizza.png"],
    ["Cheese Pizza", "98", Colors.red, "lib/images/cheese_pizza.png"],
    ["Tomato Pizza", "85", Colors.green, "lib/images/tomato_pizza.png"],
    ["Chicken Pizza", "85", Colors.brown, "lib/images/chicken_pizza.png"],
    ["Hawaiian Pizza", "80", Colors.orange, "lib/images/hawaiian_pizza.png"],
    ["Mozarella Pizza", "89", Colors.green, "lib/images/mozarella_pizza.png"],
    ["Pepperoni Pizza", "98", Colors.pink, "lib/images/pepperoni_pizza.png"],
    ["Veggie Pizza", "85", Colors.brown, "lib/images/veggie_pizza.png"],
  ];

  final Function(String, double) addToCart;
  final Function(String, double) removeFromCart;

  PizzaTab({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzaOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                //add
                String name = pizzaOnSale[index][0];
                double price = double.parse(pizzaOnSale[index][1]);
                addToCart(name, price);
              },
              child: PizzaTile(
                pizzaFlavor: pizzaOnSale[index][0],
                pizzaPrice: pizzaOnSale[index][1],
                pizzaColor: pizzaOnSale[index][2],
                imageName: pizzaOnSale[index][3],
              ),
            ),
            //add
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //delete
                GestureDetector(
                  onTap: () {
                    String name = pizzaOnSale[index][0];
                    double price = double.parse(pizzaOnSale[index][1]);
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
                    String name = pizzaOnSale[index][0];
                    double price = double.parse(pizzaOnSale[index][1]);
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
