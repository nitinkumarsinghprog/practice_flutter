import 'package:practice_flutter/models/user_model.dart';

abstract class IUserRepository {
  Future<List<UserModel>> getUsers();
}
