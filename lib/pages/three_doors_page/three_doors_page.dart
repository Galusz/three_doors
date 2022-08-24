import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:three_doors/bloc/three_doors_bloc.dart';
import 'package:three_doors/pages/three_doors_page/widgets/door.dart';

class ThreeDoorsPage extends StatefulWidget {
  const ThreeDoorsPage({Key? key}) : super(key: key);

  @override
  State<ThreeDoorsPage> createState() => _ThreeDoorsPageState();
}

class _ThreeDoorsPageState extends State<ThreeDoorsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ThreeDoorsBloc, ThreeDoorsState>(
      builder: (BuildContext context, state) {
        if (state is! Results) {
          return OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(1));
                              },
                              child: DoorWidget(door: 1)),
                        ),
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(2));
                              },
                              child: DoorWidget(door: 2)),
                        ),
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(3));
                              },
                              child: DoorWidget(door: 3)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(1));
                              },
                              child: DoorWidget(door: 1)),
                        ),
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(2));
                              },
                              child: DoorWidget(door: 2)),
                        ),
                        Flexible(
                          child: InkWell(
                              onTap: () {
                                if (state is !DoorOpened)
                                context
                                    .read<ThreeDoorsBloc>()
                                    .add(CheckDoor(3));
                              },
                              child: DoorWidget(door: 3)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          });
        } else {
          return Container();
        }
      },
    ));
  }
}
