import 'package:flutter/material.dart';
import 'package:key_secure_main_page/widgets/description.dart';
import 'package:key_secure_main_page/widgets/header.dart';
import 'package:key_secure_main_page/widgets/mainBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Header(),
            MainBody(),
            Description(),
          ],
        ),
      ),
    );
  }
}
