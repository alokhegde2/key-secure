import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/network_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/theme_services.dart';
import 'package:key_secure_v2/views/error_screens/no_connection.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';
import 'package:key_secure_v2/widgets/user_widgets/user_shimmer.dart';

class Settings extends StatelessWidget {
  final String imgUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";
  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    var networkController = Get.put(NetworkConnectivityController());
    return Obx(() => (userController.isLogedIn.value)
        ? Scaffold(
            appBar: AppBar(
              title: Text("Account"),
              centerTitle: true,
            ),
            body: (networkController.connectionStatus.value != 0)
                ? (userController.isLoading.value)
                    ? //Center(
                    // child: CircularProgressIndicator(),
                    //)
                    UserShimmer()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding),
                        child: RefreshIndicator(
                          onRefresh: () {
                            return userController.getUser();
                          },
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed("/user/update-user",
                                        parameters: {
                                          "name":
                                              "${userController.userData["user"]!.name}",
                                          "avatar":
                                              "${userController.userData["user"]!.avatar}",
                                          "email":
                                              "${userController.userData["user"]!.email}"
                                        });
                                  },
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              (userController.userData["user"]!
                                                          .avatar ==
                                                      "")
                                                  ? imgUrl
                                                  : userController
                                                      .userData["user"]!.avatar,
                                            ),
                                            fit: BoxFit.fill),
                                        color: Colors.amber),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  "${userController.userData["user"]!.name}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  "${userController.userData["user"]!.email}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding,
                                      vertical: kDefaultPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            width: 50.0,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Center(
                                                child: Icon(
                                                    CupertinoIcons.paintbrush)),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            "Change Theme",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Switch(
                                        value:
                                            ThemeServices().isSavedDarkMode(),
                                        onChanged: (value) {
                                          ThemeServices().changeThemeMode();
                                        },
                                        activeTrackColor: Colors.yellow,
                                        activeColor: Colors.orangeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed("/user/change-master");
                                },
                                child: SettingsButton(
                                  buttonColor: Colors.purpleAccent,
                                  buttonName: "Change Master Password",
                                  buttonIcon: Icons.vpn_key_outlined,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed("/user/upgrade");
                                },
                                child: SettingsButton(
                                  buttonColor: Colors.blueAccent,
                                  buttonName: "Upgrade to Pro",
                                  buttonIcon: CupertinoIcons.sort_up,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed("/user/change-password");
                                },
                                child: SettingsButton(
                                  buttonColor: Colors.pinkAccent,
                                  buttonName: "Change Password",
                                  buttonIcon: CupertinoIcons.lock,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                onTap: () {
                                  box.remove("auth-token");
                                  box.remove("id");
                                  box.remove("email");
                                  Get.offAllNamed("/welcome");
                                },
                                child: SettingsButton(
                                  buttonColor: Colors.red,
                                  buttonName: "Log Out",
                                  buttonIcon: CupertinoIcons.square_arrow_right,
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                "v 2 . 0 . 0",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                      )
                : NoConnection(
                    controller: "userController",
                    fromRoute: "/settings",
                  ),
          )
        : Unauthorized());
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SettingsButton extends StatelessWidget {
  final String buttonName;
  final IconData buttonIcon;
  final Color buttonColor;

  const SettingsButton({
    Key? key,
    required this.buttonName,
    required this.buttonIcon,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: buttonColor, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Icon(buttonIcon),
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Text(
            buttonName,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
