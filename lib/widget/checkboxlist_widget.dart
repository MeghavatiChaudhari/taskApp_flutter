import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controller/switch_button_controller.dart';

class CheckboxlistWidget extends StatelessWidget {
  final String taskId;
  CheckboxlistWidget({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.find<SwitchButtonController>();

    RxBool isChecked = false.obs;
    return Obx(() {
      final taskData = myController.taskData[taskId];
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
        value: isChecked.value,
        onChanged: (newValue) {
          if (newValue != null) {
            isChecked.value = newValue;
          }
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    });
  }
}
