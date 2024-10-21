import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label; // Nuevo parámetro para el texto

  const MyTab({
    super.key,
    required this.iconPath,
    required this.label, // Asegúrate de incluir el parámetro en el constructor
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          // Usamos Column para apilar el ícono y el texto
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              color: Colors.grey[600],
              width: 24, // Ajusta el tamaño según sea necesario
              height: 24, // Ajusta el tamaño según sea necesario
            ),
            const SizedBox(height: 2), // Espacio entre el ícono y el texto
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                color: Colors
                    .black, // Puedes ajustar el color y el tamaño del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
