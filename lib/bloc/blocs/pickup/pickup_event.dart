part of 'pickup_bloc.dart';

abstract class PickupEvent extends Equatable {
  const PickupEvent();

  @override
  List<Object> get props => [];
}

class SwipeUp extends PickupEvent {}

class SwipeDown extends PickupEvent {}
