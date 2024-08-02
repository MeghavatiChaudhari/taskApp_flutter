import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:taskapp/db_services/database.dart';
import 'package:taskapp/widget/checkboxlist_widget.dart';

class SwitchButtonController extends GetxController {
  var selectedCategory = 'Personal'.obs;
  RxBool suggest = false.obs;
  Stream<QuerySnapshot>? allTasks;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks();
  }

  void fetchAllTasks() {
    String selected = selectedCategory.value;
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
    }).onError((error) {
      print("error fetching data : $error");
    });
  }

  Widget getWork() {
    return StreamBuilder<QuerySnapshot>(
        stream: allTasks, // Ensure the type is correct
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            print("Snapshot data:");
            snapshot.data!.docs.forEach((doc) {
              print(doc.data()); // Print each document's data
            });
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
            return const Center(
              child: Text("no task found"),
            );
          }
        });
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
