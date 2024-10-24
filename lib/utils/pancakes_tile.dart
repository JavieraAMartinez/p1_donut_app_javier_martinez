import 'package:flutter/material.dart';

class PancakesTile extends StatelessWidget {
  final String pancakesFlavor;
  final String pancakesPrice;
  final dynamic pancakesColor;
  final String imageName;

  const PancakesTile(
      {super.key,
      required this.pancakesFlavor,
      required this.pancakesPrice,
      this.pancakesColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: pancakesColor[
                50], //este es para hacer más claros los fondos de los num
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .end, //esto es para que se vea del lado derecho de la fina
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: pancakesColor[
                            100], //este es para darle más color a los fondos de los num
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text(
                      '\$$pancakesPrice',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: pancakesColor[800]),
                    ))
              ],
            ),
            //Donut picture
            Padding(
              padding: const EdgeInsets.symmetric(
                  //esto sirve para acer mas pequeñas las imag
                  horizontal: 24,
                  vertical: 12),
              child: Image.asset(imageName),
            ),

            //Donut flavor text
            Text(
              pancakesFlavor,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Pancake´s',
              style: TextStyle(color: Colors.grey[600]),
            ),

            //Love icon and add button
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //spacebetween es espacio entre uno y
                children: [
                  //Loveicon
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
