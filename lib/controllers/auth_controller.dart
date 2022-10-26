import 'package:blog_app/api/api_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final APIService _apiService = APIService();
  final box = GetStorage();

  @override
  void onReady() {
    checkToken();
    super.onReady();
  }

  void checkToken() {
    final token = box.read('token');
    if (token != null) {
      // Get.offAllNamed('/home');
    }
  }

  void login(String email, String pass) async {
    final res = await _apiService.login(email, pass);
    res.fold((left) => Get.snackbar("Message", "Error Occurred"), (right) {
      Get.snackbar("Message", "Login success");
      if (right.token != null) {
        box.write('token', right.token);
      }
      print('login suuccess ${right.token}');
      Get.offAllNamed('/home');
    });
  }

  /// register

  void register(String email, String name, String pass) async {
    final res = await _apiService.register(email, name, pass);
    res.fold((left) => Get.snackbar("Message", "Error Occurred"), (right) {
      Get.snackbar("Message", "Registered");
    });
  }
}
