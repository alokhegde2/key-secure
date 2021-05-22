import 'package:get/get.dart';

class MainController extends GetxController{
  var hovered = false.obs;

  onHovered(bool value){
    hovered(value);
  }
}