import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/theme_services.dart';
import 'package:key_secure_v2/views/user_screens/change_master_pass_page.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class Settings extends StatelessWidget {
  final String imgUrl =
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0Mnx0b3dKWkZza3BHZ3x8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());

    return Obx(
      () => (userController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("Account"),
                centerTitle: true,
              ),
              body: (userController.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        (userController
                                                    .userData["user"]!.avatar ==
                                                "")
                                            ? imgUrl
                                            : userController
                                                .userData["user"]!.avatar,
                                      ),
                                      fit: BoxFit.fill),
                                  color: Colors.amber),
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
                                                BorderRadius.circular(10.0)),
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
                                    value: ThemeServices().isSavedDarkMode(),
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
                              Get.to(ChangeMasterPass());
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
                            onTap: () {},
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
                            onTap: () {},
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
          : Unauthorized(),
    );
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
