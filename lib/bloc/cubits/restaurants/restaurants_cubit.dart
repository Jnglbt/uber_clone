import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/models/models.dart';
import 'package:uber_clone/repositories/database/database_repository.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  final DatabaseRepositry _databaseRepositry;
  StreamSubscription<List<RestaurantModel>?>? _restaurantSubscription;

  RestaurantsCubit({
    required DatabaseRepositry databaseRepositry,
  })  : _databaseRepositry = databaseRepositry,
        super(RestaurantsLoading()) {
    List<RestaurantModel> restaurantsList = [];
    _restaurantSubscription =
        _databaseRepositry.getRestaurants(null).listen((restaurants) {
      Map<int, dynamic> restaurantsMap = {
        for (int i = 0; i < restaurants.length; i++) i: restaurants[i].toMap()
      };

      emit(RestaurantsLoaded(restaurants: restaurantsMap));
    });
  }

  @override
  Future<void> close() async {
    _restaurantSubscription?.cancel();
    super.close();
  }
}
