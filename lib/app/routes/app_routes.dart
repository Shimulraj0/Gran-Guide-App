part of 'app_pages.dart';
// ignore_for_file: constant_identifier_names

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const ROLE = _Paths.ROLE;
  static const AUTH = _Paths.AUTH;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const BIOMETRIC = _Paths.BIOMETRIC;
  static const VERIFY_CODE = _Paths.VERIFY_CODE;
  static const HOME = _Paths.HOME;
  static const SCAM_TIP_DETAILS = _Paths.SCAM_TIP_DETAILS;
  static const EDUCATE = _Paths.EDUCATE;
  static const PROTECTION = _Paths.PROTECTION;
  static const SUPPORT = _Paths.SUPPORT;
  static const PROFILE = _Paths.PROFILE;
  static const CHAT = _Paths.CHAT;
  static const CONTACT_PROFILE = _Paths.CONTACT_PROFILE;
  static const INCOMING_CALL = _Paths.INCOMING_CALL;
  static const PROTECTION_DETAILS = _Paths.PROTECTION_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const ROLE = '/role';
  static const AUTH = '/auth';
  static const FORGOT_PASSWORD = '/auth/forgot-password';
  static const BIOMETRIC = '/auth/biometric';
  static const VERIFY_CODE = '/auth/verify_code';
  static const HOME = '/home';
  static const SCAM_TIP_DETAILS = '/scam_tip/details';
  static const EDUCATE = '/educate';
  static const PROTECTION = '/protection';
  static const SUPPORT = '/support';
  static const PROFILE = '/profile';
  static const CHAT = '/chat';
  static const CONTACT_PROFILE = '/chat/profile';
  static const INCOMING_CALL = '/call/incoming';
  static const PROTECTION_DETAILS = '/protection/details';
}
