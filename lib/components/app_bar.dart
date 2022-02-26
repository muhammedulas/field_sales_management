import 'package:flutter/material.dart';

AppBar globalAppbar(
  String title,
  VoidCallback? callback,
  VoidCallback? themeCallback,
) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    actions: [
      IconButton(onPressed: themeCallback, icon: const Icon(Icons.dark_mode)),
      IconButton(onPressed: callback, icon: const Icon(Icons.logout))
    ],
  );
}
