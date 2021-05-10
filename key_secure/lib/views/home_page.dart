import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/add_password.dart';
import 'package:key_secure/views/all_items.dart';
import 'package:key_secure/views/auth/main_auth.dart';
import 'package:key_secure/widgets/search_bar.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Key Secure",
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
          IconButton(
              icon: Icon(CupertinoIcons.add),
              onPressed: () {
                Get.to(AddPassword());
              }),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Collections',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.shield_lefthalf_fill),
                  title: Text('All Item'),
                  selected: _selectedDestination == 0,
                  onTap: () => selectDestination(0),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.star),
                  title: Text('Favourite'),
                  selected: _selectedDestination == 1,
                  onTap: () => selectDestination(1),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'My Account',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.person),
                  title: Text('Account Details'),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
                ListTile(
                  leading: Icon(Icons.security_sharp),
                  title: Text('Change Master Pin'),
                  selected: _selectedDestination == 3,
                  onTap: () => selectDestination(3),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Key Secure',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.person),
                  title: Text('About Us'),
                  selected: _selectedDestination == 4,
                  onTap: () => selectDestination(4),
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Support Us'),
                  selected: _selectedDestination == 5,
                  onTap: () => selectDestination(5),
                ),
                ListTile(
                  leading: Icon(Icons.share_outlined),
                  title: Text('Share'),
                  selected: _selectedDestination == 6,
                  onTap: () => selectDestination(6),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text('Log out'),
                  selected: _selectedDestination == 7,
                  onTap: () {
                    selectDestination(7);
                     box.erase();
                     Get.off(MainAuth());
                    }
                ),
              ],
            ),
          ),
        ),
      ),
      body: AllItems(),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
