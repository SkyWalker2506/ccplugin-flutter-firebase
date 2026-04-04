# /flutter-setup

Setup and verify Flutter + Firebase development environment.

## Steps

### 1. Check Flutter SDK

```bash
flutter --version
```

If not found, inform the user:
- macOS: `brew install flutter` or download from https://docs.flutter.dev/get-started/install
- Verify with `flutter doctor`

### 2. Check Firebase CLI

```bash
firebase --version
```

If not found:
- Install: `npm install -g firebase-tools`
- Login: `firebase login`
- Verify: `firebase projects:list`

### 3. Check FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
flutterfire --version
```

If not found, install and configure:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

### 4. Configure MCP environment variables

The firebase MCP server requires two environment variables in `.mcp.json`:

- **SERVICE_ACCOUNT_KEY_PATH**: Absolute path to your Firebase service account JSON key file.
  - Get it from: Firebase Console > Project Settings > Service Accounts > Generate New Private Key
  - Example: `/Users/you/keys/my-project-firebase-adminsdk.json`

- **FIREBASE_PROJECT_ID**: Your Firebase project ID.
  - Find it in: Firebase Console > Project Settings > General
  - Or run: `firebase projects:list`

Update `.mcp.json` with the values:
```bash
# Read current .mcp.json, update env values, write back
```

### 5. Verify MCP servers

Test that both MCP servers can start:
```bash
npx flutter-dev-mcp --help
npx @gannonh/firebase-mcp --help
```

### 6. Run Flutter doctor

```bash
flutter doctor -v
```

Report any issues found and suggest fixes.

## Output

Print a summary:
```
Flutter SDK:      [OK/MISSING]
Firebase CLI:     [OK/MISSING]
FlutterFire CLI:  [OK/MISSING]
Service Account:  [CONFIGURED/EMPTY]
Project ID:       [CONFIGURED/EMPTY]
Flutter Doctor:   [issues summary]
```
