# flutter-firebase — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Claude Code plugin for Flutter + Firebase development via MCP integration.

## Install

```bash
claude plugin install flutter-firebase@musabkara-claude-marketplace
```

## What it provides

- **flutter-dev MCP server** — Direct Flutter SDK access: build, test, analyze, run, hot reload, pub management, code generation, localization
- **firebase MCP server** — Firebase backend operations: Firestore CRUD, Storage uploads, Auth user lookup
- **flutter-firebase skill** — Auto-activates when working with Flutter/Firebase projects
- **flutter-setup command** — Environment verification and configuration

## Quick Start

```bash
# 1. Install
./install.sh

# 2. Configure Firebase MCP (copy template, fill in values)
cp .mcp.json.template .mcp.json

# 3. Verify environment
# In Claude Code:
/flutter-setup

# 4. Create a new Flutter + Firebase project
/flutter-new
```

## Setup

### Prerequisites

1. **Flutter SDK** — Install from https://docs.flutter.dev/get-started/install
2. **Firebase CLI** — `npm install -g firebase-tools && firebase login`
3. **FlutterFire CLI** — `dart pub global activate flutterfire_cli`

### Firebase MCP configuration

The firebase MCP server requires a service account key and project ID. Copy `.mcp.json.template` to `.mcp.json` and fill in:

- `SERVICE_ACCOUNT_KEY_PATH` — Absolute path to your Firebase service account JSON
  - Get it: Firebase Console → Project Settings → Service Accounts → Generate New Private Key
- `FIREBASE_PROJECT_ID` — Your Firebase project ID (visible in Firebase Console URL)

Run `/flutter-setup` to verify everything is configured.
Run `/flutter-diagnose` for deep health check with fix suggestions.

## Example Workflow

```
User: Run the tests for the auth module
Claude: [flutter_analyze] → No issues found
        [flutter_test] → Running tests in test/auth/...
        [flutter_get_result] → 12 passed, 0 failed
```

```
User: Add a new user document to Firestore
Claude: [firestore_add_document] collection=users, data={name: "Alice", role: "admin"}
        → Document created: users/abc123
```

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
| `storage_upload` | Upload file |
| `auth_get_user` | Get user info |

## License

MIT

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ
