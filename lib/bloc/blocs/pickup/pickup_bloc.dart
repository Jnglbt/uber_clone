import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pickup_event.dart';
part 'pickup_state.dart';

class PickupBloc extends Bloc<PickupEvent, PickupState> {
  PickupBloc() : super(PickupLoading()) {
    on<SwipeUp>(_onSwipeUp);
    on<SwipeDown>(_onSwipeDown);
  }

  void _onSwipeUp(PickupEvent event, Emitter emit) {}

  void _onSwipeDown(PickupEvent event, Emitter emit) {}
}
