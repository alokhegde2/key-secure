import 'package:get/get.dart';
import 'package:key_secure/services/remote_servces.dart';
import '../models/password.dart';

class PasswordController extends GetxController {
  var passwordList = List<Password>().obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPassword();
    super.onInit();
  }

  fetchPassword() async {
    isLoading(true);
    try {
      var passwords = await RemoteServices.fetchPasswords();
      if (passwords != null) {
        passwordList.value = passwords;
        print(passwordList);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  addNewPass(String appName, String appMailId, String appPassword,
      String appUserId, String appType, String aNote, String userId,String passwordId) {
    Password password = Password(
        appName: appName,
        appMailId: appMailId,
        appPassword: appPassword,
        appUserId: appUserId,
        appType: appType,
        note: aNote,
        userId: userId,
        passwordId:passwordId
        );
    passwordList.add(password);
  }
}
