import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left:20.0,right: 20.0,bottom: 20.0,top: 80),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    height: 150,
                    width: 150.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Manage your \n Passwords with ease",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Keep your passwords safe \n with us",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xFF747474),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF12E17F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up with Email ID",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      height: 50.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 3.0,
                          color: Color(0xFF12E17F),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      height: 50.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//  Image.asset(
//                 "assets/logo/logo.png",
//                 height: 150,
//                 width: 150.0,
//               ),
//               SizedBox(
//                 height: 50.0,
//               ),
//               Text(
//                 "Manage your \n Passwords with ease",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.ubuntu(
//                   fontWeight: FontWeight.w800,
//                   fontSize: 30,
//                 ),
//               ),
//               SizedBox(
//                 height: 25.0,
//               ),
//               Text(
//                 "Keep your passwords safe \n with us",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.ubuntu(
//                   fontWeight: FontWeight.normal,
//                   fontSize: 18,
//                   color: Color(0xFF747474),
//                 ),
//               ),
//               SizedBox(
//                 height: 50.0,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Sign Up with Email ID",
//                     style: GoogleFonts.ubuntu(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   style: TextButton.styleFrom(
//                     backgroundColor: Color(0xFF12E17F),
//                     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Log In",
//                   style: GoogleFonts.ubuntu(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.grey.shade900,
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide.none,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   side: BorderSide(
//                     color: Color(0xFF12E17F),
//                     width: 3,
//                   ),
//                 ),
//               ),
