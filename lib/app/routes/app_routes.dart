part of 'app_pages.dart';
// ignore_for_file: constant_identifier_names

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const ROLE = _Paths.ROLE;
  static const AUTH = _Paths.AUTH;
  static const AUTH_SELECTION = _Paths.AUTH_SELECTION;
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
  static const ONGOING_CALL = _Paths.ONGOING_CALL;
  static const PROTECTION_DETAILS = _Paths.PROTECTION_DETAILS;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const SUBSCRIPTION_PLANS = _Paths.SUBSCRIPTION_PLANS;
  static const PAYMENT_OPTION = _Paths.PAYMENT_OPTION;
  static const SETTINGS = _Paths.SETTINGS;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const TERMS_CONDITIONS = _Paths.TERMS_CONDITIONS;
  static const PRIVACY_POLICY = _Paths.PRIVACY_POLICY;
  static const FAQS = _Paths.FAQS;
  static const HELP_CENTER = _Paths.HELP_CENTER;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const ROLE = '/role';
  static const AUTH = '/auth';
  static const AUTH_SELECTION = '/auth/selection';
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
  static const ONGOING_CALL = '/call/ongoing';
  static const PROTECTION_DETAILS = '/protection/details';
  static const EDIT_PROFILE = '/profile/edit';
  static const SUBSCRIPTION_PLANS = '/profile/subscription';
  static const PAYMENT_OPTION = '/profile/payment';
  static const SETTINGS = '/settings';
  static const CHANGE_PASSWORD = '/settings/change_password';
  static const TERMS_CONDITIONS = '/settings/terms_conditions';
  static const PRIVACY_POLICY = '/settings/privacy_policy';
  static const FAQS = '/settings/faqs';
  static const HELP_CENTER = '/settings/help_center';
}
