import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:three_doors/routes/router.gr.dart';
import 'package:three_doors/flavors.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
