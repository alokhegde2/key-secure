import 'package:flutter/material.dart';
import 'package:key_secure_web/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(),
        ],
      ),
    );
  }
}
