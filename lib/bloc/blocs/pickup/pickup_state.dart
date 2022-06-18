part of 'pickup_bloc.dart';

abstract class PickupState extends Equatable {
  const PickupState();

  @override
  List<Object> get props => [];
}

class PickupLoading extends PickupState {}

class PickupLoaded extends PickupState {}
