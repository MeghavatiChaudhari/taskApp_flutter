import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:taskapp/db_services/database.dart';
import 'package:taskapp/widget/checkboxlist_widget.dart';

class SwitchButtonController extends GetxController {
  RxString selectedCategory = 'Personal'.obs;
  RxBool suggest = false.obs;
  Stream<QuerySnapshot>? allTasks;
  final RxMap<String, dynamic> taskData = <String, dynamic>{}.obs;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks();
    // selectedCategory.listen((_) => fetchAllTasks());
  }

  void ManageTaskData(QuerySnapshot snapshot) {
    taskData.clear();
    for (var doc in snapshot.docs) {
      taskData[doc.id] = doc.data() as Map<String, dynamic>;
    }
  }

  void fetchAllTasks() {
    String selected = selectedCategory.value;
    print("started running fetechAllTasks");
    print("this is the selected categori" + selected);
    allTasks = DatabaseService().getTask(selected == 'Personal'
        ? "Personal"
        : selected == 'College'
            ? "College"
            : "Office");
    allTasks?.listen((QuerySnapshot snapshot) {
      print("received data from firestore :");
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
      ManageTaskData(snapshot);
    }).onError((error) {
      print("error fetching data : $error");
    });
  }

  Widget getWork() {
    print("building streambuilder");
    return Expanded(
      child: Obx(() {
        // Use taskData directly here to trigger UI updates
        if (taskData.isEmpty) {
          return const Center(
            child: Text("no task found"),
          );
        }
        return ListView.builder(
          itemCount: taskData.length,
          itemBuilder: (context, index) {
            String key = taskData.keys.elementAt(index);
            Map<String, dynamic> task = taskData[key];
            return CheckboxlistWidget(taskId: key);
          },
        );
      }),
    );
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    fetchAllTasks();
  }

  void checkboxState(bool checkstate) {
    suggest.value = checkstate;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
