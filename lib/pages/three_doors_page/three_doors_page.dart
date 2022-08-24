import 'package:flutter/material.dart';
import 'package:three_doors/pages/three_doors_page/widgets/door.dart';

class ThreeDoorsPage extends StatefulWidget {
  const ThreeDoorsPage({Key? key}) : super(key: key);

  @override
  State<ThreeDoorsPage> createState() => _ThreeDoorsPageState();
}

class _ThreeDoorsPageState extends State<ThreeDoorsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AnimationStatus _status = AnimationStatus.dismissed;

  // initialize _controller, _animation
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: OrientationBuilder(
                            builder:(context, orientation) {
                              if (orientation == Orientation.portrait) {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: DoorWidget(isWin: false,
                                              animController: _controller),
                                        ),

                                        Flexible(
                                          child: DoorWidget(isWin: true,
                                              animController: _controller),
                                        ),

                                        Flexible(
                                          child: DoorWidget(isWin: false,
                                              animController: _controller),
                                        ),

                                        ElevatedButton(
                                            onPressed: () {
                                              if (_status ==
                                                  AnimationStatus.dismissed) {
                                                _controller.forward();
                                              } else {
                                                _controller.reverse();
                                              }
                                            },
                                            child: const Text('Reveal The Secrets')),

                                      ],
                                    ),
                                  ),

                                  ],
                                );
                              }
                              else {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [


                                                Flexible(
                                                  child: DoorWidget(isWin: false,
                                                      animController: _controller),
                                                ),
                                                Flexible(
                                                  child: DoorWidget(isWin: true,
                                                      animController: _controller),
                                                ),
                                                Flexible(
                                                  child: DoorWidget(isWin: false,
                                                      animController: _controller),
                                                ),

                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }

    )
    );
  }
}

