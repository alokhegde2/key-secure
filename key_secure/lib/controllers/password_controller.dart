import 'package:get/get.dart';
import 'package:key_secure/services/remote_servces.dart';
import '../models/password.dart';

class PasswordController extends GetxController{
  var passwordList = <Password>[].obs();

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPassword();
    super.onInit();
  }

  void fetchPassword()async{
    isLoading(true);
    try {
      var passwords = await RemoteServices.fetchPasswords();
        if (passwords != null) {
          passwordList = passwords;
        }
    } on Exception catch (e) {
          print(e);
    } finally{
      isLoading(false);
    }
  }
}