//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<biometric_authorization/BiometricAuthorizationPlugin.h>)
#import <biometric_authorization/BiometricAuthorizationPlugin.h>
#else
@import biometric_authorization;
#endif

#if __has_include(<integration_test/IntegrationTestPlugin.h>)
#import <integration_test/IntegrationTestPlugin.h>
#else
@import integration_test;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BiometricAuthorizationPlugin registerWithRegistrar:[registry registrarForPlugin:@"BiometricAuthorizationPlugin"]];
  [IntegrationTestPlugin registerWithRegistrar:[registry registrarForPlugin:@"IntegrationTestPlugin"]];
}

@end
