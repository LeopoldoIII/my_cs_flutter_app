import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_app_bar.dart';

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Button'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Screen Button')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes implementar cualquier acción que desees para el botón en esta pantalla.
            },
            child: const Text('Other button'),
          ),
        ],
      ),
    );
  }
}
