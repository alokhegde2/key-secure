import 'package:flutter/cupertino.dart';

getScreenSize(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  if (width > 1500) {
    return "Desktop";
  } else if (width < 1500 && width > 1024) {
    return "Laptop";
  }
}
