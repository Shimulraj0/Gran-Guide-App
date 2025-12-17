import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:gran_guide_app/app/modules/verify_code/verify_code.dart';

import 'package:gran_guide_app/app/modules/splash/splash_binding.dart';
import 'package:gran_guide_app/app/modules/welcome/welcome_binding.dart';
import 'package:gran_guide_app/app/modules/role/role_binding.dart';
import 'package:gran_guide_app/app/modules/auth/auth_binding.dart';
import 'package:gran_guide_app/app/modules/verify_code/verify_binding.dart';
import 'package:gran_guide_app/app/modules/home/home_binding.dart';
import 'package:gran_guide_app/app/modules/scam_tip/scam_tip_binding.dart';

import '../modules/splash/splash_view.dart';
import '../modules/welcome/welcome_view.dart';
import '../modules/role/role_view.dart';
import '../modules/auth/auth_view.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/biometric_view.dart';
import '../modules/home/home_view.dart';
import '../modules/scam_tip/views/scam_tip_details_view.dart';
import '../modules/educate/educate_binding.dart';
import '../modules/educate/educate_view.dart';
import '../modules/protection/protection_binding.dart';
import '../modules/protection/protection_view.dart';
import '../modules/support/support_binding.dart';
import '../modules/support/support_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initialLocation = Routes.SPLASH;

  // GoRouter removed as GetX is used for navigation

  static String? get initial => Routes.SPLASH;

  static List<GetPage<dynamic>>? get routes => [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ROLE,
      page: () => const RoleView(),
      binding: RoleBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.BIOMETRIC,
      page: () => const BiometricView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_CODE,
      page: () => const VerifyCodeScreen(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCAM_TIP_DETAILS,
      page: () => const ScamTipDetailsView(),
      binding: ScamTipBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATE,
      page: () => const EducateView(),
      binding: EducateBinding(),
    ),
    GetPage(
      name: _Paths.PROTECTION,
      page: () => const ProtectionView(),
      binding: ProtectionBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];

  // Add more routes here
}
