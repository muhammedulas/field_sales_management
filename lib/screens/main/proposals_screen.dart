import 'package:field_sales_management/components/app_bar.dart';
import 'package:flutter/material.dart';
import '../settings_screen.dart';

class ProposalsScreen extends StatefulWidget {
  const ProposalsScreen({Key? key}) : super(key: key);
  static const String title = "Teklif";

  @override
  State<ProposalsScreen> createState() => _ProposalsScreenState();
}

class _ProposalsScreenState extends State<ProposalsScreen> {
  goToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: globalAppbar("Teklif",
            callback: goToSettings, sourceContext: context),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, size: 35),
        ),
      );
}
