import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/firebase_options.dart';
import 'package:taskapp/screen/todo_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskapp/controller/switch_button_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SwitchButtonController controller = Get.put(SwitchButtonController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: TodoScreen());
  }
}
