import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:taskapp/db_services/database.dart';
import 'package:taskapp/widget/checkboxlist_widget.dart';

class SwitchButtonController extends GetxController {
  var selectedCategory = 'Personal'.obs;
  RxBool suggest = false.obs;
  Stream? allTasks;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks();
  }

  void fetchAllTasks() async {
    String selected = selectedCategory.value;
    allTasks = await DatabaseService().getTask(selected == 'Personal'
        ? "Personal"
        : selected == 'College'
            ? "College"
            : "Office");
  }

  Widget getWork() {
    return StreamBuilder(
        stream: allTasks,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnap = snapshot.data!.docs[index];
                  return CheckboxlistWidget(
                      taskData: docSnap.data() as Map<String, dynamic>);
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
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
