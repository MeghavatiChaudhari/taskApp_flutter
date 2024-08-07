import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/screen/intro/screenOne.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Get.off(() => Screenone());
      });
    });

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Center(
            child: Image.asset(
              "assets/welcomeIcon.png",
              height: 300,
            ),
          ),
        ));
  }
}
