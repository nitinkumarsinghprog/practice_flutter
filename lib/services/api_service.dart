import "package:dio/dio.dart";

class ApiService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getUsers() async {
    try {
      final response = await dio.get('https://dummyjson.com/users');

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
