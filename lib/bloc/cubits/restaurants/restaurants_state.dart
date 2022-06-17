part of 'restaurants_cubit.dart';

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object> get props => [];
}

class RestaurantsLoading extends RestaurantsState {}

class RestaurantsLoaded extends RestaurantsState {
  final Map<int, dynamic> restaurants;

  const RestaurantsLoaded({required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}
