import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';
import '../settings_screen.dart';

class PriceOffersScreen extends StatefulWidget {
  const PriceOffersScreen({Key? key}) : super(key: key);
  static const String title = "Teklif";

  @override
  State<PriceOffersScreen> createState() => _PriceOffersScreenState();
}

class _PriceOffersScreenState extends State<PriceOffersScreen> {
  goToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Teklif", callback: goToSettings),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      );
}
