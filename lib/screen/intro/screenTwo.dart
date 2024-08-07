import 'package:flutter/material.dart';
import 'package:taskapp/screen/intro/view/all_screen_widget.dart';

class Screentwo extends StatelessWidget {
  const Screentwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllScreenWidget(
        imageparam: 'assets/screenTwo.png',
        text: 'Create daily routine',
      ),
    );
  }
}
