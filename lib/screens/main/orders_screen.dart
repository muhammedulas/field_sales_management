import 'package:flutter/material.dart';
import '../../components/app_bar.dart';
import '../settings_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const String title = "Sipariş";

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  goToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Sipariş", callback: goToSettings),
        body: const Center(child: CircularProgressIndicator()),
      );
}
