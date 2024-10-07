import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botón'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Esta es la pantalla del botón')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes implementar cualquier acción que desees para el botón en esta pantalla.
            },
            child: const Text('Otro botón en esta pantalla'),
          ),
        ],
      ),
    );
  }
}
