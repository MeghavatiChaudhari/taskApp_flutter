import 'package:flutter/material.dart';
import 'package:taskapp/widget/greet_widget.dart';
import 'package:taskapp/widget/category_row_widget.dart';
import 'package:taskapp/controller/switch_button_controller.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.put(SwitchButtonController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetWidget(),
              const SizedBox(height: 20),
              const CategoryRowWidget(),
              const SizedBox(height: 20),
              Obx(() {
                return CheckboxListTile(
                  activeColor: Colors.teal,
                  checkColor: Colors.white,
                  tileColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        'Make a YouTube video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  value: myController.suggest.value,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      myController.suggest.value = newValue;
                    }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
