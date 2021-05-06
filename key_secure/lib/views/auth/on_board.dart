import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/auth/sign_up/register.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF12E17F),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Hero(
                tag: "logo1",
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 100,
                  width: 100.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 400.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/secure.svg",
                            height: 250.0,
                            width: 250,
                          ),
                          SizedBox(height: 35.0),
                          Text(
                            'Your data will be secure with us,In our server',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/forgot.svg",
                            height: 250.0,
                            width: 250,
                          ),
                          SizedBox(height: 35.0),
                          Text(
                            'No need to remember your password,We\'ll remember for you',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: FlatButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFFE504F),
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                                child: Icon(
                              CupertinoIcons.chevron_right,
                              size: 40,
                            )),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Get.to(Register());
                          },
                          child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFFE504F),
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                                child: Icon(
                              CupertinoIcons.chevron_right,
                              size: 40,
                            )),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
