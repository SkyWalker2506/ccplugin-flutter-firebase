# /flutter-new

Scaffold a new Flutter project with Firebase integration.

## Trigger

`/flutter-new`, `/flutter-new-project`, "new flutter project", "create flutter app"

## Steps

### 1. Gather project info

Ask the user:
- Project name (snake_case, e.g. `my_app`)
- Organization domain (e.g. `com.example`)
- Target platforms: Android, iOS, Web (default: Android + iOS)
- Firebase features needed: Auth, Firestore, Storage, Cloud Functions (select all that apply)

### 2. Create Flutter project

```bash
flutter create --org <org_domain> --platforms <platforms> <project_name>
cd <project_name>
```

### 3. Add Firebase core packages

```bash
flutter pub add firebase_core
```

Add selected features:
- Auth: `flutter pub add firebase_auth`
- Firestore: `flutter pub add cloud_firestore`
- Storage: `flutter pub add firebase_storage`
- Functions: `flutter pub add cloud_functions`

### 4. Configure FlutterFire

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Guide user through Firebase project selection or creation.

### 5. Update main.dart

Instruct the user to add Firebase initialization to `main.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

### 6. Run initial build

```bash
flutter pub get
flutter analyze
```

### 7. Output summary

Print:
```
Flutter + Firebase Project Created:
  Project:    <name>
  Platforms:  <list>
  Firebase:   <features>
  Next step:  flutter run
```

## Notes

- If flutterfire configure fails, run `/flutter-setup` first
- For web platform, also run: `flutter pub add firebase_analytics`
- Generated `firebase_options.dart` should NOT be committed to public repos
