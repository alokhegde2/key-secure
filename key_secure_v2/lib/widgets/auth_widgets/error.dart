import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({required this.error});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_shield,
          color: Colors.red,
        ),
        SizedBox(
          width: 20.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 120,
          child: Text(
            "$error",
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: GoogleFonts.poppins(color: Colors.red),
          ),
        ),
      ],
    );
  }
}