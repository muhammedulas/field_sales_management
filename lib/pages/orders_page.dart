import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../services/auth_service.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);
  static const String title = "Sipariş";

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
        appBar: globalAppbar("Sipariş", logout, switchTheme),
        body: const Center(child: CircularProgressIndicator()),
      );
}
