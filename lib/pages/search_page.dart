import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const String title = "Home";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getGlobalAppbar("Search"),
        body: const Center(child: Text("Search")),
        backgroundColor: Colors.white,
      );
}
