import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final box = GetStorage();

  static saveToken(String token) {
    box.write('token', token);
  }

  static String getToken() {
    String token = box.read('token');
    return token;
  }

  static bool isLoggedIn() {
    String token = box.read('token');
    if (token != '') {
      return true;
    } else {
      return false;
    }
  }
}
