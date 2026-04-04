# ccplugin-flutter-firebase

Claude Code plugin for Flutter + Firebase development via MCP integration.

## What it provides

- **flutter-dev MCP server** — Direct Flutter SDK access: build, test, analyze, run, hot reload, pub management, code generation, localization
- **firebase MCP server** — Firebase backend operations: Firestore CRUD, Storage uploads, Auth user lookup
- **flutter-firebase skill** — Auto-activates when working with Flutter/Firebase projects
- **flutter-setup command** — Environment verification and configuration

## Installation

Add this plugin to your Claude Code configuration:

```bash
cd ~/Projects/ccplugin-flutter-firebase
claude plugins add .
```

## Setup

### Prerequisites

1. **Flutter SDK** — Install from https://docs.flutter.dev/get-started/install
2. **Firebase CLI** — `npm install -g firebase-tools && firebase login`
3. **FlutterFire CLI** — `dart pub global activate flutterfire_cli`

### Firebase MCP configuration

The firebase MCP server requires a service account key and project ID. Set these in `.mcp.json`:

#### SERVICE_ACCOUNT_KEY_PATH

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Project Settings > Service Accounts**
4. Click **Generate New Private Key**
5. Save the JSON file to a secure location (e.g., `~/.config/firebase/service-account.json`)
6. Set the absolute path in `.mcp.json`

#### FIREBASE_PROJECT_ID

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Project Settings > General**
4. Copy the **Project ID**
5. Set it in `.mcp.json`

Alternatively, run `firebase projects:list` to see all your project IDs.

### Verify setup

Run the setup command in Claude Code:

```
/flutter-setup
```

This checks Flutter SDK, Firebase CLI, FlutterFire CLI, and MCP configuration.

## MCP tools

### flutter-dev

| Tool | Description |
|------|-------------|
| `flutter_build` | Build for target platform |
| `flutter_test` | Run tests |
| `flutter_analyze` | Static analysis |
| `flutter_pub_get` | Fetch dependencies |
| `flutter_pub_add` | Add dependency |
| `flutter_run` | Launch on device/emulator |
| `flutter_hot_reload` | Hot reload (preserves state) |
| `flutter_hot_restart` | Hot restart (resets state) |
| `flutter_clean` | Clean build artifacts |
| `flutter_devices` | List devices |
| `flutter_build_runner` | Code generation |
| `flutter_gen_l10n` | Generate localizations |
| `flutter_logs` | View logs |
| `flutter_kill` | Stop running app |

### firebase

| Tool | Description |
|------|-------------|
| `firestore_add_document` | Create document |
| `firestore_get_document` | Read document |
| `firestore_update_document` | Update document |
| `firestore_delete_document` | Delete document |
| `firestore_list_documents` | List documents |
| `firestore_list_collections` | List collections |
| `firestore_query_collection_group` | Query subcollections |
| `storage_list_files` | List storage files |
| `storage_upload` | Upload file |
| `storage_upload_from_url` | Upload from URL |
| `storage_get_file_info` | File metadata |
| `auth_get_user` | Get user info |

## License

MIT
