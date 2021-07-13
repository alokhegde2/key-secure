import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class PasswordShimmer extends StatelessWidget {
  const PasswordShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade300,
      enabled: true,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.0,
                    width: 150.0,
                    color: Colors.white,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding + 5),
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.0,
                    width: 150.0,
                    color: Colors.white,
                  ),
                  Container(
                    height: 20.0,
                    width: 80.0,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Wrap(
                spacing: 20,
                children: [
                  CategoryTile(),
                  CategoryTile(),
                  CategoryTile(),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.0,
                    width: 150.0,
                    color: Colors.white,
                  ),
                  Container(
                    height: 20.0,
                    width: 80.0,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              PasswordTile(),
              SizedBox(
                height: 8.0,
              ),
              PasswordTile(),
              SizedBox(
                height: 8.0,
              ),
              PasswordTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 30.0,
          width: 90.0,
          color: Colors.white,
        ),
      ],
    );
  }
}

class PasswordTile extends StatelessWidget {
  const PasswordTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      // margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
