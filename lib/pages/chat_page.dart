import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../services/auth_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String title = "Sohbet";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void logout() {
    var authService = Provider.of<AuthService>(context);
    authService.logout();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Sohbet", logout),
        body: const Center(child: CircularProgressIndicator()),
        backgroundColor: Colors.white,
      );
}
