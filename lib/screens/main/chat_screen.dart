import 'package:flutter/material.dart';
import '../../components/app_bar.dart';
import '../settings_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String title = "Sohbet";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  goToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Sohbet",
            callback: goToSettings, sourceContext: context),
        body: const Center(child: CircularProgressIndicator()),
      );
}
