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

## Async Operations

Many flutter-dev MCP tools return immediately with a task ID and run in the background. Use `flutter_get_result` to poll for completion:

```
# Start a build
result = flutter_build(platform="apk", debug=True)
task_id = result["taskId"]

# Poll until done
result = flutter_get_result(task_id=task_id)
# When result["status"] == "done", check result["output"]
```

Always use `flutter_get_result` after: `flutter_build`, `flutter_run`, `flutter_test`.
Do NOT use it after: `flutter_analyze`, `flutter_pub_get`, `flutter_pub_add` (these are synchronous).

## Common Errors & Recovery

### Xcode signing errors
```
Error: No signing certificate "iOS Development" found
```
Fix: Open Xcode → Preferences → Accounts → download certificates, or use `flutter build ios --no-codesign` for simulator testing.

### Gradle build failures
```
Error: Could not resolve com.android.tools.build:gradle
```
Fix:
1. `flutter clean`
2. Check `android/build.gradle` for outdated Gradle version
3. Update to latest stable: `distributionUrl=https://services.gradle.org/distributions/gradle-8.x-all.zip`

### Firebase 403 / Permission Denied
```
Error: Missing or insufficient permissions
```
Fix:
1. Verify `SERVICE_ACCOUNT_KEY_PATH` points to valid JSON file
2. Check Firebase Console → IAM — service account needs `Cloud Datastore User` role
3. Verify `FIREBASE_PROJECT_ID` matches your project (run `firebase projects:list`)

### Firebase MCP not connecting
Fix:
1. Verify `.mcp.json` has correct `SERVICE_ACCOUNT_KEY_PATH` (absolute path, not `~`)
2. Check JSON file exists: `ls -la /path/to/service-account.json`
3. Re-run `/flutter-setup` to validate config

### flutter_analyze returns errors
- Fix errors in order shown — later errors often depend on earlier ones
- Use `// ignore: <rule_name>` for intentional suppressions only
- Run `dart fix --apply` to auto-fix common issues before manual review

## Firebase MCP Setup

The Firebase MCP server requires a service account key. Quick setup:

1. Go to Firebase Console → Project Settings → Service Accounts
2. Click "Generate New Private Key" → download JSON
3. Move to a safe location: `mv ~/Downloads/key.json ~/keys/firebase-adminsdk.json`
4. Update `.mcp.json`:
   - `SERVICE_ACCOUNT_KEY_PATH`: `/Users/you/keys/firebase-adminsdk.json` (absolute path)
   - `FIREBASE_PROJECT_ID`: your project ID (visible in Firebase Console URL)
