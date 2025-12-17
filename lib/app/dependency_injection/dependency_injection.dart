import '../modules/auth/auth_binding.dart';
import '../modules/role/role_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/welcome/welcome_binding.dart';

/// Convenience class to initialize all controller bindings
/// Note: Not required if using per-route bindings in app_pages.dart
class DependencyInjection {
  static void init() {
    SplashBinding().dependencies();
    WelcomeBinding().dependencies();
    RoleBinding().dependencies();
    AuthBinding().dependencies();
  }
}
