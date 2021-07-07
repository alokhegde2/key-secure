import 'package:get/get.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:key_secure/services/remote_services.dart';
// import '../main.dart';
// import '../models/password.dart';

class PasswordController extends GetxController {
  // var passwordList = List<Password>().obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // passwordList.value = [];
    fetchPassword();
    super.onInit();
  }

  fetchPassword() async {
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(box.read('jwt'));

    isLoading(true);
    // try {
    //   // print(decodedToken["id"]);
    //   // var passwords = await RemoteServices.fetchPasswords(decodedToken["id"]);
    //   // if (passwords != null) {
    //   //   passwordList.value = passwords;
    //   //   // print("Hello");
    // //   }
    // // } on Exception catch (e) {
    // //   print(e);
    // // } finally {
    // //   isLoading(false);
  }
}

// addNewPass(
//   String appName,
//   String appMailId,
//   String appPassword,
//   String appUserId,
//   String appType,
//   String aNote,
//   String userId,
//   String passwordId) {
// Password password = Password(
//     appName: appName,
//     appMailId: appMailId,
//     appPassword: appPassword,
//     appUserId: appUserId,
//     appType: appType,
//     note: aNote,
//     userId: userId,
//     passwordId: passwordId);
// passwordList.add(password);
// }
// }
