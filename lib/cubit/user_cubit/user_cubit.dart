// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_flutter/models/user_model.dart';
import 'package:practice_flutter/repositories/user/i_user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository repository;

  UserCubit(this.repository) : super(UserInitial()) {
    getUsers();
  }

  Future<void> getUsers() async {
    emit(UserLoading());

    try {
      final users = await repository.getUsers();

      emit(UserSuccess(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
