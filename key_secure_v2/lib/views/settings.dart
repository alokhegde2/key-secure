import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/services/theme_services.dart';

class Settings extends StatelessWidget {
  final String imgUrl =
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0Mnx0b3dKWkZza3BHZ3x8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("Account"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
                          imgUrl,
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
                "Alok Hegde",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              child: Text(
                "alok@gmail.com",
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
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50.0,
                            width: 50.0,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0)),
                            child:
                                Center(child: Icon(CupertinoIcons.paintbrush)),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "Change Theme",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 16),
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
                )),
            SizedBox(
              height: 5.0,
            ),
            InkWell(
              onTap: () {},
              child: SettingsButton(
                  ButtonColor: Colors.purpleAccent,
                  ButtonName: "Change Access Code",
                  ButtonIcon: CupertinoIcons.lock),
            ),
            SizedBox(
              height: 5.0,
            ),
            InkWell(
              onTap: () {},
              child: SettingsButton(
                  ButtonColor: Colors.blueAccent,
                  ButtonName: "Upgrade to Pro",
                  ButtonIcon: CupertinoIcons.sort_up),
            ),
            SizedBox(
              height: 5.0,
            ),
            InkWell(
              onTap: () {},
              child: SettingsButton(
                  ButtonColor: Colors.red,
                  ButtonName: "Log Out",
                  ButtonIcon: CupertinoIcons.square_arrow_right),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "v 2.0.0",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String ButtonName;
  final IconData ButtonIcon;
  final Color ButtonColor;

  const SettingsButton({
    Key? key,
    required this.ButtonName,
    required this.ButtonIcon,
    required this.ButtonColor,
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
                color: ButtonColor, borderRadius: BorderRadius.circular(10.0)),
            child: Center(child: Icon(ButtonIcon)),
          ),
          SizedBox(
            width: 30.0,
          ),
          Text(
            ButtonName,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
