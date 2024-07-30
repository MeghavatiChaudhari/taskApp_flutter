import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:taskapp/db_services/database.dart';
import 'package:taskapp/widget/category_row_widget.dart';
import 'package:taskapp/widget/category_widget.dart';
import 'package:taskapp/db_services/database.dart';
import 'package:taskapp/controller/switch_button_controller.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key});

  void dialogueBox(SwitchButtonController controller) {
    Get.dialog(
      AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.cancel),
                  ),
                  const SizedBox(width: 60),
                  const Text('Add todo task',
                      style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Add Text"),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(border: Border.all(width: 2.0)),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter the task",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> userTodo = {
                        // "work":  ,
                        "Id": id
                      };
                      String selected = controller.selectedCategory.value;
                      if (selected == 'Personal') {
                        DatabaseService().addPersonalTask(userTodo, id);
                      } else if (selected == 'Office') {
                        DatabaseService().addPersonalTask(userTodo, id);
                      } else if (selected == 'Office') {
                        DatabaseService().addPersonalTask(userTodo, id);
                      }
                      Get.back();
                    },
                    child: const Center(
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController Controller = Get.find();
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        dialogueBox(Controller);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
