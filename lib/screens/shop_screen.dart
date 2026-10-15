import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: Column(
        children: [
          Text('Welcome to the Shop! This is staging env testing.'),
          const Center(
            child: Text('🛒 Shop Space (WordPress API Integration)'),
          ),
        ],
      ),
    );
  }
}
