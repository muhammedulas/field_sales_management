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
    var authService = Provider.of<AuthService>(context);
    authService.logout();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Sipariş", logout),
        body: const Center(child: CircularProgressIndicator()),
        backgroundColor: Colors.white,
      );
}
