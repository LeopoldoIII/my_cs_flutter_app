import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Widget destination;

  // Constructor que acepta los parámetros
  const CustomCardWidget({
    required this.title,
    required this.leading,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.5), // Color de la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Icon(leading, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
