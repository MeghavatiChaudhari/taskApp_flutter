import 'package:flutter/material.dart';
import 'package:taskapp/widget/add_button_widget.dart';
import 'package:taskapp/widget/greet_widget.dart';
import 'package:taskapp/widget/category_row_widget.dart';
import 'package:taskapp/controller/switch_button_controller.dart';
import 'package:get/get.dart';
import 'package:taskapp/widget/checkboxlist_widget.dart';
import 'package:taskapp/widget/theme_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.put(SwitchButtonController());

    return const Scaffold(
      floatingActionButton: AddButtonWidget(),
      body: Stack(
        children: [
          ThemeWidget(),
          const SingleChildScrollView(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetWidget(),
                SizedBox(height: 20),
                CategoryRowWidget(),
                SizedBox(height: 20),
                CheckboxlistWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
