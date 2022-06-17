import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/models/models.dart';
import 'package:uber_clone/repositories/database/database_repository.dart';

part 'food_categories_state.dart';

class FoodCategoriesCubit extends Cubit<FoodCategoriesState> {
  final DatabaseRepositry _databaseRepositry;
  StreamSubscription<List<CategoryModel>?>? _categorySubscription;

  FoodCategoriesCubit({required DatabaseRepositry databaseRepositry})
      : _databaseRepositry = databaseRepositry,
        super(FoodCategoriesLoading()) {
    _categorySubscription =
        _databaseRepositry.getFoodCategories().listen((categories) {
      Map<String, String> foodCategories = {
        for (var e in categories) e.image: e.name
      };
      emit(FoodCategoriesLoaded(foodCategories: foodCategories));
    });
  }

  @override
  Future<void> close() async {
    _categorySubscription?.cancel();
    super.close();
  }
}
