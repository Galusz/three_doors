import 'package:bloc/bloc.dart';
import 'package:three_doors/flavors.dart';

part 'three_doors_event.dart';
part 'three_doors_state.dart';

class ThreeDoorsBloc extends Bloc<ThreeDoorsEvent, ThreeDoorsState>{
  ThreeDoorsBloc() : super(ThreeDoorsInitial()){
    on<CheckDoor>((event,emit) async {
      if (F.appFlavor == Flavor.DEV) {
        emit(DoorOpened(door: event.door, isWin: true));
      }
      else {
        emit(DoorOpened(door: event.door, isWin: DateTime.now().millisecond%5==1));
      }
    });

    on<ShowResults>((event,emit) async {
      emit(Results(isWin: event.isWin));
    });

    on<Restart>((event,emit) async {
        emit(ThreeDoorsInitial());
    });
  }
}