import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String title = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getGlobalAppbar("Home"),
        body: const Center(child: Text("Home")),
        backgroundColor: Colors.white,
      );
}
