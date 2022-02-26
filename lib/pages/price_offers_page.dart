import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class PriceOffersPage extends StatefulWidget {
  const PriceOffersPage({Key? key}) : super(key: key);
  static const String title = "Teklif";

  @override
  State<PriceOffersPage> createState() => _PriceOffersPageState();
}

class _PriceOffersPageState extends State<PriceOffersPage> {
  void logout() {
    var authService = Provider.of<AuthService>(context, listen: false);
    authService.logout();
  }

  void switchTheme() {
    var authService = Provider.of<AuthService>(context, listen: false);
    authService.switchTheme();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Teklif", logout, switchTheme),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      );
}