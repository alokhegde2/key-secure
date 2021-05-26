import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';

class Search extends StatelessWidget {
  final double width;

  const Search({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/search');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding+5),
        height: 50.0,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search . . .",style: GoogleFonts.poppins(fontSize:15),),
            Icon(CupertinoIcons.search)
          ],
        ),
      ),
    );
  }
}
