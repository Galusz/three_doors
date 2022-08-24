part of 'three_doors_bloc.dart';

abstract class ThreeDoorsState {
  const ThreeDoorsState();
}

class ThreeDoorsInitial extends ThreeDoorsState {}

class DoorOpened extends ThreeDoorsState {
  final int door;
  final bool isWin;

  const DoorOpened({required this.door, required this.isWin});
}

class Results extends ThreeDoorsState {
  final bool isWin;

  const Results({required this.isWin});
}
