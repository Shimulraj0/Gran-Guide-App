import 'package:get/get.dart';
import '../modules/auth/auth_binding.dart';
import '../modules/role/role_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/welcome/welcome_binding.dart';
import '../modules/verify_code/verify_binding.dart';

/// Optional: Initial binding to load all controllers globally at app startup
/// Note: Individual bindings already exist in each module and are used in routes
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies();
    WelcomeBinding().dependencies();
    RoleBinding().dependencies();
    AuthBinding().dependencies();
    VerifyCodeBinding().dependencies();
    // ForgotPasswordBinding().dependencies();
    // BiometricBinding().dependencies();
  }
}
