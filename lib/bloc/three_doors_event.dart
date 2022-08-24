part of 'three_doors_bloc.dart';

abstract class ThreeDoorsEvent {
  const ThreeDoorsEvent();
}

class CheckDoor extends ThreeDoorsEvent {
  final int door;
  const CheckDoor(this.door);
}

class Restart extends ThreeDoorsEvent{}

class ShowResults extends ThreeDoorsEvent{
  final bool isWin;
  const ShowResults(this.isWin);
}

