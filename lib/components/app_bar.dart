import 'package:flutter/material.dart';

AppBar globalAppbar(String title, {VoidCallback? callback}) {
  if (callback != null) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        IconButton(onPressed: callback, icon: const Icon(Icons.settings))
      ],
    );
  } else {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
