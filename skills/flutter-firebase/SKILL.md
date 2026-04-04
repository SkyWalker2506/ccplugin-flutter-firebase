# Flutter + Firebase Skill

## Triggers

Auto-activate when the user mentions:
- flutter, dart, widget, pubspec, pub get, pub add
- firebase, firestore, firebase auth, cloud functions, firebase storage
- mobile development, ios build, android build, hot reload
- build runner, code generation, l10n

## MCP Servers

### flutter-dev

Flutter development server providing direct SDK integration:

| Tool | Description |
|------|-------------|
| `flutter_build` | Build the app for a target platform (apk, ios, web, etc.) |
| `flutter_test` | Run unit, widget, and integration tests |
| `flutter_analyze` | Run static analysis (dart analyze) on the project |
| `flutter_pub_get` | Fetch package dependencies |
| `flutter_pub_add` | Add a new package dependency |
| `flutter_run` | Launch the app on a connected device or emulator |
| `flutter_hot_reload` | Hot reload running app (preserves state) |
| `flutter_hot_restart` | Hot restart running app (resets state) |
| `flutter_clean` | Clean build artifacts |
| `flutter_devices` | List connected devices and emulators |
| `flutter_build_runner` | Run build_runner for code generation (freezed, json_serializable, etc.) |
| `flutter_gen_l10n` | Generate localization files |
| `flutter_logs` | View device/app logs |
| `flutter_kill` | Stop a running app |
| `flutter_get_result` | Get the result of an async flutter operation |

### firebase

Firebase backend services via MCP:

| Tool | Description |
|------|-------------|
| `firestore_add_document` | Create a new document in a Firestore collection |
| `firestore_get_document` | Read a single document by path |
| `firestore_update_document` | Update fields on an existing document |
| `firestore_delete_document` | Delete a document |
| `firestore_list_documents` | List documents in a collection |
| `firestore_list_collections` | List all top-level collections |
| `firestore_query_collection_group` | Query across subcollections |
| `storage_list_files` | List files in Firebase Storage |
| `storage_upload` | Upload a file to Storage |
| `storage_upload_from_url` | Upload from a URL to Storage |
| `storage_get_file_info` | Get metadata for a stored file |
| `auth_get_user` | Retrieve user info from Firebase Auth |

## Workflow

1. Use `flutter_analyze` before builds to catch issues early
2. Use `flutter_pub_get` / `flutter_pub_add` for dependency management
3. Use `flutter_build_runner` after adding/changing freezed or json_serializable models
4. Use `flutter_test` to verify changes
5. Use `flutter_run` + `flutter_hot_reload` for rapid iteration
6. Use Firestore tools for direct database operations during development
7. Use Storage tools for asset and file management
8. Use `auth_get_user` to debug authentication issues
