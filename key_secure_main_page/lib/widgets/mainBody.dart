import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF4E79F8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF493FEF),
            Color(0xFF50A0FE),
          ],
        ),
      ),
      padding:
          EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0, bottom: 30.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width < 768.0)
                  ? null
                  : MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Key Secure - A password management application",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "A password management application(Password Manager).Manage all your passwords at one place and in multiple platforms.",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 60,
                    runSpacing: 20.0,
                    children: [
                      Container(
                        height: 50.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Image.asset(
              "assets/images/Main_Screen.png",
              scale: 1.0,
              width: 300.0,
            )
          ],
        ),
      ),
    );
  }
}
