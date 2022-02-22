import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);
  static const String title = "Home";

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getGlobalAppbar("Notifications"),
        body: const Center(child: Text("Notifications")),
        backgroundColor: Colors.white,
      );
}
