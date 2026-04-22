# /flutter-diagnose

Deep health check of Flutter + Firebase development environment with fix suggestions.

## Trigger

`/flutter-diagnose`, `/diagnose`, "diagnose flutter", "check flutter setup", "flutter not working"

## Steps

### 1. Flutter SDK check

```bash
flutter --version
flutter doctor -v
```

Parse output and flag any `[!]` or `[✗]` issues with fix commands.

### 2. Firebase CLI check

```bash
firebase --version
firebase login:list
```

- Check CLI version (warn if < 13.0)
- Verify at least one account is logged in
- If not logged in: suggest `firebase login`

### 3. FlutterFire CLI check

```bash
flutterfire --version
```

If missing: `dart pub global activate flutterfire_cli`

### 4. MCP configuration check

Read `.mcp.json` in current directory:
- Verify `firebase.env.SERVICE_ACCOUNT_KEY_PATH` is set and not a placeholder
- Verify `firebase.env.FIREBASE_PROJECT_ID` is set
- Check that `SERVICE_ACCOUNT_KEY_PATH` file actually exists on disk
- Check JSON is valid (not corrupted)
- Report each as: OK / MISSING / INVALID / FILE_NOT_FOUND

### 5. Firebase project connectivity

```bash
firebase projects:list
```

Verify the `FIREBASE_PROJECT_ID` appears in the list.

### 6. Dart/Flutter project check (if in a Flutter project directory)

```bash
flutter pub get
flutter analyze --no-fatal-infos
```

Report: dependency count, analysis issues count.

### 7. Device check

```bash
flutter devices
```

List available devices. Warn if none found.

### 8. Summary report

```
Flutter Environment Diagnosis:
  Flutter SDK:          OK / MISSING (version X.Y.Z)
  Flutter Doctor:       OK / N issues found
  Firebase CLI:         OK / MISSING / NOT LOGGED IN
  FlutterFire CLI:      OK / MISSING
  .mcp.json config:     OK / MISSING FIELDS
  Service account file: OK / NOT FOUND
  Firebase project:     OK / NOT FOUND (project: X)
  Dart analysis:        OK / N issues
  Devices available:    N devices

Fix suggestions:
  [list any issues with exact fix commands]
```

## Notes

- Never print actual file contents of service account JSON — security risk
- Run after any environment change
- Run before filing a bug report
