import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/widgets/password_card.dart';

class AllItems extends StatefulWidget {
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  final passwordController = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return TabandAbove(passwordController: passwordController);
        } else {
          return BelowTab(passwordController: passwordController);
        }
      },
    );
  }
}

class TabandAbove extends StatelessWidget {
  TabandAbove({
    Key key,
    @required this.passwordController,
  }) : super(key: key);


  final PasswordController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        top: 20,
      ),
      child: Obx(
        () {
          if (passwordController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: passwordController.passwordList.length,
            itemBuilder: (context, index) {
              return PasswordCard(passwordController.passwordList[index]);
            },
          );
        },
      ),
    );
  }
}

class BelowTab extends StatelessWidget {
  BelowTab({
    Key key,
    @required this.passwordController,
  }) : super(key: key);

  final PasswordController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Obx(
        () {
          if (passwordController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: passwordController.passwordList.length,
            itemBuilder: (context, index) {
              return PasswordCard(passwordController.passwordList[index]);
            },
          );
        },
      ),
    );
  }
}
