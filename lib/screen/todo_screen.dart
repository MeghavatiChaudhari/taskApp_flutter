import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/widget/add_button_widget.dart';
import 'package:taskapp/widget/greet_widget.dart';
import 'package:taskapp/widget/category_row_widget.dart';
import 'package:taskapp/controller/switch_button_controller.dart';
import 'package:get/get.dart';
import 'package:taskapp/widget/theme_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.put(SwitchButtonController());

    return Scaffold(
      floatingActionButton: const AddButtonWidget(),
      body: Stack(
        children: [
          const ThemeWidget(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetWidget(),
                const SizedBox(height: 20),
                const CategoryRowWidget(),
                const SizedBox(height: 20),
                myController.getWork(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
