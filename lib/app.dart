import 'package:flutter/material.dart';
import 'package:github/routes/routes.router.dart';
import 'package:stacked_services/stacked_services.dart';

class Github extends StatelessWidget {
  const Github({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Github projects",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
