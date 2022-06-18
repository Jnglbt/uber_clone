import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/models.dart';
import '../../../../repositories/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DatabaseRepositry _databaseRepositry;
  final StorageRepository _storageRepository;

  UserBloc(
      {required DatabaseRepositry databaseRepositry,
      required StorageRepository storageRepository})
      : _databaseRepositry = databaseRepositry,
        _storageRepository = storageRepository,
        super(UserCreating()) {
    on<UserCreate>((_onUserCreate));
    on<UpdateUser>((_onUpdateUser));
    on<UpdateUserImage>((_onUpdateUserImage));
  }

  void _onUserCreate(UserCreate event, Emitter<UserState> emit) async {
    await _databaseRepositry.createUser(event.user);

    emit(
      UserCreated(user: event.user),
    );
  }

  void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {
    if (state is UserCreated) {
      _databaseRepositry.updateUser(event.user);
      emit(UserCreated(user: event.user));
    }
  }

  void _onUpdateUserImage(
      UpdateUserImage event, Emitter<UserState> emit) async {
    final state = this.state;
    if (state is UserCreated) {
      UserModel user = state.user;

      await _storageRepository.uploadImage(user, event.image);

      _databaseRepositry.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}
