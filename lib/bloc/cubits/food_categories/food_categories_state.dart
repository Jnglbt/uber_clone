part of 'food_categories_cubit.dart';

abstract class FoodCategoriesState extends Equatable {
  const FoodCategoriesState();

  @override
  List<Object> get props => [];
}

class FoodCategoriesLoading extends FoodCategoriesState {}

class FoodCategoriesLoaded extends FoodCategoriesState {
  final Map<String, String> foodCategories;

  const FoodCategoriesLoaded({required this.foodCategories});

  @override
  List<Object> get props => [foodCategories];
}
