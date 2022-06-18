import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/models.dart';
import '../../../../../repositories/repositories.dart';

part 'restaurants_by_category_state.dart';

class RestaurantsByCategoryCubit extends Cubit<RestaurantsByCategoryState> {
  final DatabaseRepositry _databaseRepositry;
  StreamSubscription<List<RestaurantModel>?>? _restaurantSubscription;

  RestaurantsByCategoryCubit({
    required DatabaseRepositry databaseRepositry,
  })  : _databaseRepositry = databaseRepositry,
        super(CategoryLoading());

  void getRestaurantsByTag(String tag) {
    List<RestaurantModel> restaurantsList = [];
    _restaurantSubscription =
        _databaseRepositry.getRestaurants(tag).listen((restaurants) {
      Map<int, dynamic> restaurantsMap = {
        for (int i = 0; i < restaurants.length; i++) i: restaurants[i].toMap()
      };
      String tag = restaurantsMap.values.elementAt(0)['tag'];

      emit(CategoryLoaded(restaurants: restaurantsMap, tag: tag));
    });
  }

  @override
  Future<void> close() async {
    _restaurantSubscription?.cancel();
    super.close();
  }
}
