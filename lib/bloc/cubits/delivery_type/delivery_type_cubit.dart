import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_type_state.dart';

class DeliveryTypeCubit extends Cubit<DeliveryTypeState> {
  DeliveryTypeCubit()
      : super(const DeliveryTypeState(DeliveryType.delivery, 0));

  void getNavBarItem(DeliveryType navbarItem) {
    switch (navbarItem) {
      case DeliveryType.delivery:
        emit(const DeliveryTypeState(DeliveryType.delivery, 0));
        break;
      case DeliveryType.pickup:
        emit(const DeliveryTypeState(DeliveryType.pickup, 1));
        break;
    }
  }
}
