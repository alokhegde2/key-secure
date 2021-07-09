import 'package:get/get.dart';

class SelectAppController extends GetxController {
  var selectAppName = "Other".obs;
  var selectAppImage = " ".obs;
  var icons = [].obs;
  var rawIcons = {
    "results": {"alok": "123", "ama": "5689"}
  };
  var actualData;
  var actualDataList;

  @override
  void onInit() {
    super.onInit();
  }

  getIcons() {}

  searchQuery(String query) {
    actualData = rawIcons["results"];
    actualDataList = actualData.keys.toList();

    icons.clear();
    if (query.trim() == "") {
      icons.clear();
    }
    for (var i = 0; i < actualDataList.length; i++) {
      if (query.trim() == "") {
        icons.clear();
      } else if (actualDataList[i]
              .toLowerCase()
              .contains(query.toLowerCase()) &&
          !icons.contains(actualDataList[i])) {
        icons.add(actualDataList[i]);
      }
    }
    print(icons);
  }
}
