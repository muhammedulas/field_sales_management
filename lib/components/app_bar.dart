import 'package:flutter/material.dart';

AppBar getGlobalAppbar(String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    foregroundColor: Colors.black,
    actions: const [Icon(Icons.abc)],
  );
}
