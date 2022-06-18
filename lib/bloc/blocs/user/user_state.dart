part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserCreating extends UserState {}

class UserCreated extends UserState {
  final UserModel user;

  const UserCreated({required this.user});

  @override
  List<Object> get props => [user];
}
