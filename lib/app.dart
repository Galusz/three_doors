import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:three_doors/bloc/three_doors_bloc.dart';
import 'package:three_doors/routes/router.gr.dart';
import 'package:three_doors/flavors.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ThreeDoorsBloc())
      ],
      child: MaterialApp.router(
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
