part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserCreate extends UserEvent {
  final UserModel user;

  const UserCreate({
    this.user = const UserModel(
      id: '',
      fName: '',
      lName: '',
      phone: '',
      image: '',
      email: '',
    ),
  });

  @override
  List<Object?> get props => [user];
}

class UpdateUser extends UserEvent {
  final UserModel user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpdateUserImage extends UserEvent {
  final UserModel? user;
  final XFile image;

  const UpdateUserImage({this.user, required this.image});

  @override
  List<Object?> get props => [user, image];
}
