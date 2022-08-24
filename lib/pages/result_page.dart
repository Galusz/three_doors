import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/three_doors_bloc.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.read<ThreeDoorsBloc>().add(Restart());
      context.router.replaceNamed('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThreeDoorsBloc, ThreeDoorsState>(
        builder: (BuildContext context, state) {
          if (state is Results) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(state.isWin ? "You Win" : "You Fail"),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Restarting game"),
                  const SizedBox(
                    height: 30,
                  ),
                  const CircularProgressIndicator()
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
