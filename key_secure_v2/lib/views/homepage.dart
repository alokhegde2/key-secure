import 'package:flutter/material.dart';
import 'package:key_secure_v2/responsive.dart';
import 'package:key_secure_v2/views/password_details.dart';
import 'package:key_secure_v2/views/password_list.dart';
import 'package:key_secure_v2/widgets/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Responsive(
        mobile: PasswordList(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: PasswordList(),
            ),
            Expanded(
              flex: 9,
              child: PasswordDetails(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: Menu(),
            ),
            VerticalDivider(),
            Expanded(
              flex: _size.width > 1340 ? 4 : 6,
              child: PasswordList(),
            ),
            VerticalDivider(),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: PasswordDetails(),
            ),
          ],
        ),
      )),
    );
  }
}

// RaisedButton(
//   onPressed: () {
//     ThemeServices().changeThemeMode();
//   },
//   child: Text("Change theme"),
// ),
