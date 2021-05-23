import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: FlutterLogo(),
              ),
              Column(
                children: [Text("Alok Hegde"), Text("alok@gmail.com")],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.square_arrow_right,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
