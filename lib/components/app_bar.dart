import 'package:flutter/material.dart';

AppBar globalAppbar(String title, VoidCallback? callback) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    foregroundColor: Colors.black,
    actions: [IconButton(onPressed: callback, icon: const Icon(Icons.logout))],
  );
}
