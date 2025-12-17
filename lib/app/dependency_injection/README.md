# Dependency Injection

This folder provides **optional** centralized dependency injection for all controllers.

## ⚠️ Important Note

**Individual bindings already exist** in each module folder:
- `modules/splash/splash_binding.dart`
- `modules/welcome/welcome_binding.dart`
- `modules/role/role_binding.dart`
- `modules/auth/auth_binding.dart`

These are already configured in `app_pages.dart` and are the **recommended approach**.

## When to Use This Folder

Only use this DI folder if you need to:
- Initialize all controllers globally at app startup
- Share controllers across multiple routes
- Keep all controllers in memory throughout the app lifecycle

For most apps, **use the per-route bindings** already in modules.

## Files

### `dependency_injection.dart`
Convenience class to initialize all module bindings at once.

**Usage (only if needed):**
```dart
import 'app/dependency_injection/di.dart';

void main() {
  DependencyInjection.init(); // Initializes all controllers
  runApp(GranGuideApp());
}
```

### `controller_bindings.dart`
Optional `InitialBinding` for global initialization via GetMaterialApp.

**Usage (only if needed):**
```dart
GetMaterialApp(
  initialBinding: InitialBinding(),
  // ...
)
```

## Recommended Approach

**Use the existing per-route bindings** in `app_pages.dart`:
```dart
GetPage(
  name: _Paths.SPLASH,
  page: () => const SplashView(),
  binding: SplashBinding(), // ✅ Already configured
)
```

This approach:
- ✅ Better memory management
- ✅ Controllers loaded only when needed
- ✅ Automatic cleanup when routes are removed
- ✅ Follows GetX best practices
