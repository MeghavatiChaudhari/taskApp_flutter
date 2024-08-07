import 'package:flutter/material.dart';
import 'package:taskapp/screen/intro/view/all_screen_widget.dart';

class Screenone extends StatelessWidget {
  const Screenone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllScreenWidget(
        imageparam: 'assets/screenOne.png',
        text: 'Manage your tasks',
      ),
    );
  }
}
