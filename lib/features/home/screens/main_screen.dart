import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/features/button_feature/screens/button_screen.dart'; // Importa la pantalla del botón
import 'package:my_cs_flutter_app/features/radio_button_feature/screens/radio_button_screeen.dart'; // Importa la pantalla del botón
import 'package:my_cs_flutter_app/shared/widgets/custom_card_widget.dart'; // Importa el widget genérico

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Usamos el widget genérico para el primer ítem
          CustomCardWidget(
            title: 'Botón',
            leading: Icons.touch_app,
            destination: ButtonScreen(), // Pantalla a la que navega
          ),
          // Usamos el widget genérico para el segundo ítem
          CustomCardWidget(
            title: 'Radio Button',
            leading: Icons.radio_button_checked,
            destination: RadioButtonScreen(), // Otra pantalla
          ),
          // Aquí puedes añadir más widgets reutilizando el mismo widget genérico
        ],
      ),
    );
  }
}
