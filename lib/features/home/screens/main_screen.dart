import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/features/button_feature/screens/button_screen.dart'; 


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Botón'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ButtonScreen()),
            );
          },
        ),
      ),
    );
  }
}
