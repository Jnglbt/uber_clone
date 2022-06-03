part of 'restaurants_by_category_cubit.dart';

abstract class RestaurantsByCategoryState extends Equatable {
  const RestaurantsByCategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends RestaurantsByCategoryState {}

class CategoryLoaded extends RestaurantsByCategoryState {
  final String tag;
  final Map<int, dynamic> restaurants;

  const CategoryLoaded({required this.restaurants, required this.tag});

  @override
  List<Object> get props => [restaurants, tag];
}
