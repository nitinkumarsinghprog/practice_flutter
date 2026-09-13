
abstract class IUserRepository {
  Future<Map<String, dynamic>> getUsers(int skip, int limit);
}
