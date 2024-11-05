import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Optional actions for the AppBar

  // Constructor with a required title and optional actions
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        key: const ValueKey('navBarText'),
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      centerTitle: true, // Center the title
      actions: [
        // Logo as an action item
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            'assets/images/GlobalLogoBlacksmall.png',
            height: 30,
            width: 60,
            fit: BoxFit.contain,
          ),
        )
      ], // Optional actions like icons or buttons
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Default AppBar height
}
