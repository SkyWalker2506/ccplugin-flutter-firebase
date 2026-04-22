# ccplugin-flutter-firebase — Sprint Plan
> Generated: 2026-04-22 | Based on: MASTER_ANALYSIS.md

---

## Sprint 1 — Foundation

**Goal:** Make the plugin installable and add basic error guidance.
**Time estimate:** 2-3 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 1.1 | Add install.sh | `install.sh` | Create with dep check + symlink + next steps |
| 1.2 | Add uninstall.sh with $HOME guard | `uninstall.sh` | Create with safety guards |
| 1.3 | Add .mcp.json.template | `.mcp.json.template` | Pre-filled with placeholder + comments |
| 1.4 | Add common errors to SKILL.md | `skills/flutter-firebase/SKILL.md` | Xcode, Gradle, Firebase 403 section |
| 1.5 | Add flutter_get_result pattern | `skills/flutter-firebase/SKILL.md` | Async operations section |

---

## Sprint 2 — Commands

**Goal:** Add real onboarding commands and deep health check.
**Time estimate:** 3-4 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 2.1 | Add /flutter-new command | `commands/flutter-new.md` | Scaffold Flutter + Firebase project |
| 2.2 | Add /flutter-diagnose command | `commands/flutter-diagnose.md` | Deep health check with fix suggestions |
| 2.3 | Improve flutter-setup — Firebase step-by-step | `commands/flutter-setup.md` | Add service account guide |
| 2.4 | Add GitHub topics | GitHub repo settings | flutter, firebase, claude-code, mobile, mcp |
| 2.5 | Add Firebase auth pattern to SKILL.md | `skills/flutter-firebase/SKILL.md` | SERVICE_ACCOUNT_KEY_PATH setup |

---

## Sprint 3 — Polish

**Goal:** Make plugin marketplace-ready with docs and discoverability.
**Time estimate:** 2-3 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 3.1 | Add README demo section | `README.md` | Example MCP conversation |
| 3.2 | Add CHANGELOG | `CHANGELOG.md` | Initial version history |
| 3.3 | Add /firebase-config command | `commands/firebase-config.md` | Guided Firebase project connection |
| 3.4 | Update plugin.json with dependencies | `plugin.json` | Add flutter, firebase-tools, dart deps |
| 3.5 | Add README badges | `README.md` | Version, license, platform badges |
