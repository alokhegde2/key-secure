import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  var selectedCategory = "Others".obs;

  changeSelectedCategory(category) {
    selectedCategory(category);
  }
}
