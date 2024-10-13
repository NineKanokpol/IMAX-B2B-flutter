import 'package:flutter/material.dart';

class ShopItemPage extends StatefulWidget {
  const ShopItemPage({super.key});

  @override
  State<ShopItemPage> createState() => _ShopItemPageState();
}

class _ShopItemPageState extends State<ShopItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('page 2'),
        ),
      ),
    );
  }
}
