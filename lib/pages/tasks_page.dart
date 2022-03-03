import 'package:field_sales_management/components/app_bar.dart';
import 'package:field_sales_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  static const String title = "Görevlendirmeler";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  void logout() {
    var authService = Provider.of<AuthService>(context, listen: false);
    authService.logout();
  }

  void switchTheme() {
    var authService = Provider.of<AuthService>(context, listen: false);
    authService.setTheme();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Görevlendirmeler", logout, switchTheme),
        body: const Center(child: CircularProgressIndicator()),
      );
}
