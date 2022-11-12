import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/controllers/theme_controller.dart';

import '../services/firebase_storage_service.dart';

class InitailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    // Get.put(FirebaseStorageService());
    Get.lazyPut(() =>  FirebaseStorageService());
  }
}