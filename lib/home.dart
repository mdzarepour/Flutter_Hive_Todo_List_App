import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const SizedBox(width: double.infinity),
          Container(
            width: 380,
            height: 132,
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              border: Border.all(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
