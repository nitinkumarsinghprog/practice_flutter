// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_flutter/models/user_model.dart';
import 'package:practice_flutter/repositories/user/i_user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository repository;

  int skip = 0;
  final int limit = 30;

  int total = 0;

  bool isLoadingMore = false;

  Timer? _throttleTimer;

  UserCubit(this.repository) : super(UserInitial());

  Future<void> getUsers() async {
    emit(UserLoading());

    try {
      skip = 0;

      final response = await repository.getUsers(skip, limit);

      final users = response['users'] as List<UserModel>;

      total = response['total'] as int;

      emit(UserSuccess(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void getMoreUsers() {
    if (isLoadingMore) {
      return;
    }

    final currentState = state;

    if (currentState is! UserSuccess) {
      return;
    }

    if (currentState.users.length >= total && total != 0) {
      return;
    }

    if (_throttleTimer?.isActive ?? false) {
      return;
    }

    _throttleTimer = Timer(const Duration(milliseconds: 500), () async {
      await _loadMoreUsers();
    });
  }

  Future<void> _loadMoreUsers() async {
    if (isLoadingMore) {
      return;
    }

    final currentState = state;

    if (currentState is! UserSuccess) {
      return;
    }

    if (currentState.users.length >= total && total != 0) {
      return;
    }

    isLoadingMore = true;

    try {
      final nextSkip = currentState.users.length;

      final response = await repository.getUsers(nextSkip, limit);

      final newUsers = response['users'] as List<UserModel>;

      final updatedUsers = [...currentState.users, ...newUsers];

      emit(UserSuccess(updatedUsers));
    } catch (e) {
      emit(UserError(e.toString()));
    } finally {
      isLoadingMore = false;
    }
  }

  @override
  Future<void> close() {
    _throttleTimer?.cancel();
    return super.close();
  }
}
