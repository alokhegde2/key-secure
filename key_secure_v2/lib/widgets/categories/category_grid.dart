import 'package:flutter/material.dart';
import 'package:key_secure_v2/data/category_icon.dart';
import 'package:key_secure_v2/widgets/categories/category_tile.dart';

import '../../constants.dart';

class CategoryGrid extends StatelessWidget {
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 385;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650 &&
      MediaQuery.of(context).size.width >= 385;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding * 2, horizontal: kDefaultPadding),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: (isSmallMobile(context)) ? 2 : 3,
        childAspectRatio: (() {
          if (isDesktop(context)) {
            return kwebchildAspectRatio;
          } else if (isTablet(context)) {
            return ktabchildAspectRatio;
          } else if (isMobile(context)) {
            return kmobilechildAspectRatio;
          } else {
            return ksmallmobilechildAspectRatio;
          }
        }()),
        physics: ClampingScrollPhysics(),
        children: [
          CategoryTile(
            tileColor: Colors.redAccent,
            tileIcon: categoryIcon["social"],
            tileText: "Social",
            catName: "Social",
          ),
          CategoryTile(
            tileColor: Colors.purpleAccent,
            tileIcon: categoryIcon["finance"],
            tileText: "Finance",
            catName: "Finance",
          ),
          CategoryTile(
            tileColor: Colors.pinkAccent,
            tileIcon: categoryIcon["entertainment"],
            tileText: "Entertainment",
            catName: "Entertainment",
          ),
          CategoryTile(
            tileColor: Colors.pinkAccent,
            tileIcon: categoryIcon["food_and_drink"],
            tileText: "Food&Drink",
            catName: "Food & Drink",
          ),
          CategoryTile(
            tileColor: Colors.orangeAccent,
            tileIcon: categoryIcon["education"],
            tileText: "Education",
            catName: "Education",
          ),
          CategoryTile(
            tileColor: Colors.tealAccent,
            tileIcon: categoryIcon["dating"],
            tileText: "Dating",
            catName: "Dating",
          ),
          CategoryTile(
            tileColor: Colors.yellowAccent,
            tileIcon: categoryIcon["design"],
            tileText: "Design",
            catName: "Design",
          ),
          CategoryTile(
            tileColor: Colors.lightGreenAccent,
            tileIcon: categoryIcon["business"],
            tileText: "Business",
            catName: "Business",
          ),
          CategoryTile(
            tileColor: Colors.indigoAccent,
            tileIcon: categoryIcon["games"],
            tileText: "Games",
            catName: "Games",
          ),
          CategoryTile(
            tileColor: Colors.cyanAccent,
            tileIcon: categoryIcon["shopping"],
            tileText: "Shopping",
            catName: "Shopping",
          ),
          CategoryTile(
            tileColor: Colors.tealAccent,
            tileIcon: categoryIcon["others"],
            tileText: "Others",
            catName: "Others",
          ),
        ],
      ),
    );
  }
}
