import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_app_bar.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Slider Screen'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Slider Value: ${_sliderValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            Slider(
              value: _sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,  // Divide the slider into 100 steps
              label: _sliderValue.toStringAsFixed(2),  // Show the value as a label
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              activeColor: Colors.pink,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
