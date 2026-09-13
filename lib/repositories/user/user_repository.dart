import 'package:practice_flutter/models/user_model.dart';
import 'package:practice_flutter/repositories/user/i_user_repository.dart';
import 'package:practice_flutter/services/api_service.dart';

class UserRepository implements IUserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  @override
  Future<Map<String, dynamic>> getUsers(int skip, int limit) async {
    final response = await apiService.get(
      'https://dummyjson.com/users?skip=$skip&limit=$limit',
    );

    final List<UserModel> users = (response.data['users'] as List)
        .map((user) => UserModel.fromJson(user))
        .toList();

    return {'users': users, 'total': response.data['total']};
  }
}
