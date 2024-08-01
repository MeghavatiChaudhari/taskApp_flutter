import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controller/switch_button_controller.dart';

class CheckboxlistWidget extends StatelessWidget {
  final Map<String, dynamic> taskData;

  const CheckboxlistWidget({Key? key, required this.taskData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwitchButtonController myController =
        Get.put(SwitchButtonController());
    return Obx(() {
      return CheckboxListTile(
        activeColor: Colors.teal,
        checkColor: Colors.white,
        tileColor: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              taskData['title'] ?? 'No Title',
              style: const TextStyle(
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
    });
  }
}
