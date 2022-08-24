import 'package:flutter/material.dart';
import 'dart:math';

class DoorWidget extends StatefulWidget {
  final bool isWin;
  final AnimationController animController;

  const DoorWidget(
      {Key? key, required this.isWin, required this.animController})
      : super(key: key);

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
    _controller = widget.animController;
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
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
                      child: widget.isWin
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
  }
}
