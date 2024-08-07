import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controller/switch_button_controller.dart';
import 'package:taskapp/db_services/database.dart';

class CheckboxlistWidget extends StatelessWidget {
  final String taskId;
  const CheckboxlistWidget({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.find<SwitchButtonController>();

    return Obx(() {
      final taskData = myController.taskData[taskId];
      final isChecked = myController.checkedStates[taskId]?.value ?? false;
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
              taskData?['task'] ?? 'No task',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        value: isChecked,
        onChanged: (newValue) {
          if (newValue != null) {
            myController.checkedtick(taskId, newValue);
            if (newValue) {
              print(newValue);
              DatabaseService()
                  .deleteTask(taskId, myController.selectedCategory.value);
            }
          }
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    });
  }
}
