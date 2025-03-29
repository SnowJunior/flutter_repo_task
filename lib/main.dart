import 'package:flutter/material.dart';
import 'package:github/app.dart';
import 'package:github/routes/routes.locator.dart';

Future main() async {
  await setupLocator();
  runApp(const Github());
}

