abstract class BaseApiServices {
  Future<dynamic> post(
      {required String url, required dynamic body, required String token});
  Future<dynamic> get({required String url});
}
