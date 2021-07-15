import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (width > 728.0) ? 150.0 : 50, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.redAccent.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                "About",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "What's Key Secure?",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Key Secure is a password management application.Using key secure you can save all your password at one place and access it anywhere in the world with easily.Using Key Secure you have no need to remember your passwords we’ll do this for you. ",
          ),
          SizedBox(
            height: 50.0,
          ),
          FirstGroup(width: width),
          SizedBox(
            height: 50.0,
          ),
          SecondGroup(width: width),
        ],
      ),
    );
  }
}

class FirstGroup extends StatelessWidget {
  const FirstGroup({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 50.0,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.orangeAccent.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    "Password Manager",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Managing Your Passwords\nmore easy with our application",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8C4DFF),
                            Color(0xFFC04DFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "All your passwords saved safe and securely with us",
                        style: TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFA74D),
                            Color(0xFFFFDE8A),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.search_circle_fill,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Easy to find ",
                        style: TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Image.asset(
            "assets/images/Account.png",
            scale: 1.0,
            width: 300.0,
          ),
        ],
      ),
    );
  }
}

class SecondGroup extends StatelessWidget {
  const SecondGroup({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 50.0,
        children: [
          Image.asset(
            "assets/images/Account.png",
            scale: 1.0,
            width: 300.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.orangeAccent.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    "Password Manager",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Managing Your Passwords\nmore easy with our application",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8C4DFF),
                            Color(0xFFC04DFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "All your passwords saved safe and securely with us",
                        style: TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFA74D),
                            Color(0xFFFFDE8A),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.search_circle_fill,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Easy to find ",
                        style: TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
