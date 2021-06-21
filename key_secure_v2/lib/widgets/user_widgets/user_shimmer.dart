import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class UserShimmer extends StatelessWidget {
  const UserShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade300,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.50,
                color: Colors.white,
                height: 15.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.50,
                color: Colors.white,
                height: 15.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 30.0),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
