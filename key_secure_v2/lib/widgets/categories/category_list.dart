import 'package:flutter/material.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/data/category_icon.dart';
import 'package:key_secure_v2/widgets/categories/category_tile.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          CategoryTile(
            tileColor: Colors.redAccent,
            tileIcon: categoryIcon["social"],
            tileText: "Social",
            catName: "Social",
          ),
          SizedBox(
            width: 25.0,
          ),
          CategoryTile(
            tileColor: Colors.purpleAccent,
            tileIcon: categoryIcon["finance"],
            tileText: "Finance",
            catName: "Finance",
          ),
          SizedBox(
            width: 25.0,
          ),
          CategoryTile(
            tileColor: Colors.pinkAccent,
            tileIcon: categoryIcon["entertainment"],
            tileText: "Entertainment",
            catName: "Entertainment",
          ),
          SizedBox(
            width: 25.0,
          ),
          CategoryTile(
            tileColor: Colors.pinkAccent,
            tileIcon: categoryIcon["food_and_drink"],
            tileText: "Food&Drink",
            catName: "Food & Drink",
          ),
        ],
      ),
    );
  }
}
