import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final Dio dio;

  Api() : dio = Dio() {
    // Initialize Dio with shared preferences interceptor
    _initializeSharedPrefsInterceptor();
    // Support flutter web:
    dio.options.extra['withCredentials'] = true;
    // TODO: test over HTTPS connection
  }

  Future<void> _initializeSharedPrefsInterceptor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Add shared preferences interceptor to Dio
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Get cookies from shared preferences and set them in the request headers
        final cookies = prefs.getStringList('cookies') ?? [];
        options.headers['cookie'] = cookies.join(';');
        print('onRequest');
        print(cookies.join(';'));
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        // Save received cookies to shared preferences
        final List<String> setCookie = response.headers.map['set-cookie'] ?? [];
        final List<String> updatedCookies = [
          ...prefs.getStringList('cookies') ?? [],
          ...setCookie
        ];
        await prefs.setStringList('cookies', updatedCookies);
        print('onResponse');
        print(updatedCookies);
        return handler.next(response);
      },
    ));
  }

  // Method to clear stored cookies
  Future<void> clearCookies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cookies');
  }
}

class SessionManager {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    print('_prefs:');
    print(prefs.getStringList('cookies'));
  }

  // Method to check if the user is logged in
  bool isLoggedIn() {
    // Check if the session data exists
    return prefs.containsKey('isLoggedIn')
        ? prefs.getBool('isLoggedIn')!
        : false;
  }

  // Method to log in the user
  Future<void> login() async {
    // Save the session data
    await prefs.setBool('isLoggedIn', true);
    print('login!');
    print(prefs.getBool('isLoggedIn'));
    // You can also save other user-related data like username, etc.
  }

  // Method to log out the user
  Future<void> logout() async {
    // Clear the session data
    await prefs.remove('isLoggedIn');
    // You can also clear other user-related data
  }
}

final api = Api(); // Create an instance of the Api class
