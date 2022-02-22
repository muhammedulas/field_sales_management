import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  static const String title = "Home";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getGlobalAppbar("Chat"),
        body: const Center(child: Text("Chat")),
        backgroundColor: Colors.white,
      );
}
