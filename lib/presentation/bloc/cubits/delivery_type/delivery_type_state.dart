part of 'delivery_type_cubit.dart';

enum DeliveryType { delivery, pickup }

class DeliveryTypeState extends Equatable {
  final DeliveryType type;
  final int index;

  const DeliveryTypeState(this.type, this.index);

  @override
  List<Object> get props => [type, index];
}
