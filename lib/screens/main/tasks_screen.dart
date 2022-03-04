import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';
import '../settings_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);
  static const String title = "Görevlendirmeler";

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  goToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Görevlendirmeler", callback: goToSettings),
        body: const Center(child: CircularProgressIndicator()),
      );
}
