import 'package:flutter/material.dart';
import 'package:key_secure_v2/widgets/passwords/password_tile.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 250,
        itemBuilder: (context, index) {
          return PasswordTile();
        },
      ),
    );
  }
}
