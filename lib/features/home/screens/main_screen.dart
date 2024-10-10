import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/features/button_feature/screens/button_screen.dart'; // Importa la pantalla del botón
import 'package:my_cs_flutter_app/features/radio_button_feature/screens/radio_button_screeen.dart'; // Importa la pantalla del botón
import 'package:my_cs_flutter_app/features/swithc_features/screens/switch_screen.dart';
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
          CustomCardWidget(
            title: 'Botón',
            leading: Icons.touch_app,
            destination: ButtonScreen(),
          ),
          CustomCardWidget(
            title: 'Radio Button',
            leading: Icons.radio_button_checked,
            destination: RadioButtonScreen(), 
          ),
          CustomCardWidget(
              title: 'Switch',
              leading: Icons.toggle_on,
              destination: SwitchScreen())
        ],
      ),
    );
  }
}
