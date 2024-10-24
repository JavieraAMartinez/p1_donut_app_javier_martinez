import 'package:flutter/material.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String imageName;

  const SmoothieTile(
      {super.key,
      required this.smoothieFlavor,
      required this.smoothiePrice,
      this.smoothieColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: smoothieColor[
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
                        color: smoothieColor[
                            100], //este es para darle más color a los fondos de los num
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text(
                      '\$$smoothiePrice',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: smoothieColor[800]),
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
              smoothieFlavor,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Smoothie´s',
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
