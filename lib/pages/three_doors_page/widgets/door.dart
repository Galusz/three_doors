import 'package:flutter/material.dart';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/three_doors_bloc.dart';

class DoorWidget extends StatefulWidget {
  final int door;

  const DoorWidget({Key? key, required this.door}) : super(key: key);

  @override
  State<DoorWidget> createState() => _DoorWidgetState();
}

class _DoorWidgetState extends State<DoorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThreeDoorsBloc, ThreeDoorsState>(
        listener: (BuildContext context, state) {
      if (state is DoorOpened) {
        if (state.door == widget.door) {
          setState(() {
            _controller.forward();
          });
        }
        Future.delayed(const Duration(seconds: 2), () {
          context.read<ThreeDoorsBloc>().add(ShowResults(state.isWin));
          context.router.replaceNamed('/result');
        });
      }
    }, builder: (BuildContext context, state) {
      return AspectRatio(
        aspectRatio: 1,
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0015)
            ..rotateY(pi * _animation.value),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: _animation.value <= 0.5
                    ? Container(
                        child: Center(
                            child: FittedBox(
                        child: Icon(
                          Icons.door_front_door_outlined,
                          size: 600,
                        ),
                      )))
                    : Container(
                        child: (state as DoorOpened).isWin
                            ? const Center(
                                child: FittedBox(
                                child: Icon(
                                  Icons.diamond_outlined,
                                  size: 600,
                                ),
                              ))
                            : Center(
                                child: FittedBox(
                                  child: const Text(
                                    '?',
                                    style: TextStyle(
                                        fontSize: 600, color: Colors.white),
                                  ),
                                ),
                              ))),
          ),
        ),
      );
    });
  }
}
