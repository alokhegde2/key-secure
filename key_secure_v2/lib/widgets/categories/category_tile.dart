import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTile extends StatelessWidget {
  final Color tileColor;
  final String tileText;
  final String tileIcon;
  final String catName;

  const CategoryTile({
    Key? key,
    required this.tileColor,
    required this.tileText,
    required this.tileIcon,
    required this.catName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Get.toNamed("/category/$catName", parameters: {
              "title": tileText,
              "query": catName,
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Image.network(
                tileIcon,
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          tileText,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
