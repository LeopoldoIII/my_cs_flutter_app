import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_app_bar.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _updateProgress();
  }

  // Function to simulate progress
  void _updateProgress() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _progressValue += 0.01; // Increment progress
        if (_progressValue < 1.0) {
          _updateProgress(); // Continue updating until complete
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Progress Indicator',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: _progressValue, // Value between 0.0 and 1.0
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
            SizedBox(height: 20),
            Text(
              'Progress: ${(_progressValue * 100).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
