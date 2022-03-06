import 'package:flutter/material.dart';

AppBar globalAppbar(String title,
    {VoidCallback? callback, required dynamic sourceContext}) {
  if (callback != null) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        IconButton(onPressed: callback, icon: const Icon(Icons.settings))
      ],
      foregroundColor: Theme.of(sourceContext).colorScheme.onBackground,
    );
  } else {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Theme.of(sourceContext).colorScheme.onBackground,
    );
  }
}
