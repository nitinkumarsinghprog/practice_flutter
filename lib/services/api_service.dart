import "package:dio/dio.dart";

class ApiService {
  final Dio dio = Dio();

  Future<Response> get(String url) async {
    try {
      final response = await dio.get(url);

      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
