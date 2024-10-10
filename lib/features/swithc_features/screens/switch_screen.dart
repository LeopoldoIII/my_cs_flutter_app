import 'dart:ffi';

import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  // Boolean variable to keep track of the switch state
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Screen'),
        actions: [
          Icon(
            _isSwitched ? Icons.lightbulb : Icons.lightbulb_outline,
            color: _isSwitched ? Colors.yellow : Colors.grey,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Switch is ${_isSwitched ? "ON" : "OFF"}',
                style: TextStyle(
                  fontSize: 24.0,
                  color: _isSwitched ? Colors.green : Colors.black,
                )),
            const SizedBox(height: 20),
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Text(
                'Animated Text ${_isSwitched ? "ON" : "OFF"}',
                key: ValueKey(_isSwitched),
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
