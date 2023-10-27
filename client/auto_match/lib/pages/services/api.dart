import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Api {
  final Dio dio;

  Api() : dio = Dio() {
    final cookieJar = CookieJar(); // Create a CookieJar instance
    dio.interceptors.add(CookieManager(cookieJar)); // Add a CookieManager interceptor to Dio
  }
}

final api = Api(); // Create an instance of the Api class

