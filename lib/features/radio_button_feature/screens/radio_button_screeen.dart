import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_app_bar.dart';

class RadioButtonScreen extends StatefulWidget {
  @override
  _RadioButtonScreenState createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  // Variable que guarda la opción seleccionada
  String _selectedOption = 'Option 1';

  // Lista de opciones
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Radio Button Screen'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: _options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
