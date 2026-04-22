# ccplugin-flutter-firebase — Master Analysis Report
> Generated: 2026-04-22 | Categories: 5 | Mode: Lead Orchestrator

---

## Executive Summary

- **Overall score: 4.8/10**
- **Strongest area:** Core Skill Definition (#1) — 7/10; triggers, MCP table, and workflow are clear and actionable
- **Weakest area:** Setup Experience (#3) — 2.5/10; complex manual setup with no automation, no error recovery
- **Critical action count: 14** (must fix before production adoption)

The plugin concept is solid: flutter-dev MCP + Firebase MCP is a powerful pairing that genuinely accelerates mobile development. However, the plugin is "documentation-only" — it documents capabilities without providing scaffolding, templates, error handling, or real onboarding. A developer hitting this plugin for the first time must manually configure 2 environment variables, set up 3 CLI tools, and understand 2 MCP servers with zero hand-holding. The SKILL.md is informative but not directive.

---

## Score Card

| # | Category | Score | Critical Gaps | Improvement Potential |
|---|----------|-------|---------------|----------------------|
| 1 | Core Skill & MCP Coverage | 7.0/10 | 2 | Medium — already solid |
| 2 | Command Quality (flutter-setup) | 4.0/10 | 4 | High — add validation + auto-fix |
| 3 | Setup Experience & Onboarding | 2.5/10 | 4 | Critical — needs scaffolding |
| 4 | Error Handling & Recovery | 3.0/10 | 3 | High — zero error recovery |
| 5 | Documentation & Discoverability | 5.0/10 | 3 | Medium — README weak |

**Weighted Average: 4.3/10**

---

## Category Analysis

### #1 — Core Skill & MCP Coverage (7/10)

SKILL.md trigger list is comprehensive and covers all major Flutter/Firebase entry points. MCP tool table is accurate and well-organized. Workflow section (1-8 steps) is actionable.

**Gaps:**
- No mention of error handling patterns (e.g., what to do when `flutter_analyze` returns errors)
- Firebase MCP auth flow not explained — `SERVICE_ACCOUNT_KEY_PATH` setup not in SKILL.md, only in flutter-setup command
- No `flutter_get_result` usage pattern — async operations unclear

---

### #2 — Command Quality (4/10)

`flutter-setup.md` is the only command. It checks tools and reports status but:
- Does NOT auto-install missing tools (just tells user)
- Does NOT validate service account JSON file exists
- Does NOT test actual MCP connectivity (just checks `--help` flag)
- Output format defined but not enforced — LLM may deviate
- No `/flutter-new-project` command for bootstrapping a new Flutter+Firebase project
- No `/flutter-firebase-init` for connecting existing app to Firebase

**Missing commands:**
- `/flutter-new` — scaffold new Flutter project with Firebase
- `/flutter-diagnose` — deep health check with fix suggestions
- `/firebase-config` — guided Firebase project setup

---

### #3 — Setup Experience & Onboarding (2.5/10)

This is the critical failure point. A developer must:
1. Manually edit `.mcp.json` with correct paths
2. Create Firebase service account key (4 steps in Firebase console)
3. Install 3 separate CLI tools
4. Run `flutterfire configure` interactively
5. Hope the MCP servers work

There is no guided wizard, no template `.mcp.json`, no validation script. The `plugin.json` lists `mcpServers` but these are not auto-configured on install. Compare to `ccplugin-frontend-craft` which has `install.sh` — flutter-firebase has no install script at all.

**Gaps:**
- No `install.sh` / `uninstall.sh`
- No `.mcp.json.template` for users to copy
- No guided setup wizard
- No quick-start example in README

---

### #4 — Error Handling & Recovery (3/10)

Zero error handling patterns documented:
- What happens when `flutter_build` fails? No escalation path.
- What if Firebase MCP loses connection? No reconnect guide.
- `flutter_get_result` is listed but usage pattern for async ops is unclear.
- No common errors + solutions section (Xcode signing, Gradle issues, Firebase permissions)

---

### #5 — Documentation & Discoverability (5/10)

README is basic but present. `plugin.json` has keywords. However:
- No GitHub topics on repo
- No demo/screenshot showing flutter-dev MCP in action
- README does not explain "why this plugin vs. just using flutter CLI"
- No CHANGELOG
- No badge (version, license)

---

## Top 14 Priority Actions

| # | Action | Category | Impact | Effort | Priority |
|---|--------|----------|--------|--------|----------|
| 1 | Add `install.sh` — symlink SKILL.md, validate deps, print next steps | Setup | High | S | P0 |
| 2 | Add `uninstall.sh` with `$HOME` guard | Setup | High | S | P0 |
| 3 | Add `.mcp.json.template` — pre-filled with placeholder values + comments | Setup | High | S | P0 |
| 4 | Add `/flutter-new` command — scaffold Flutter + Firebase project | Commands | High | M | P0 |
| 5 | Add common errors section to SKILL.md (Xcode signing, Gradle, Firebase 403) | Error Handling | High | S | P0 |
| 6 | Add `flutter_get_result` usage pattern to SKILL.md workflow | Skill | Medium | S | P1 |
| 7 | Add `/flutter-diagnose` command — deep health check | Commands | High | M | P1 |
| 8 | Add Firebase setup guide to flutter-setup command (service account step-by-step) | Setup | High | S | P1 |
| 9 | Add GitHub topics: `flutter`, `firebase`, `claude-code`, `mobile`, `mcp` | Discoverability | High | S | P1 |
| 10 | Add async operation pattern to SKILL.md — when to use `flutter_get_result` | Skill | Medium | S | P1 |
| 11 | Add README demo section — example conversation showing MCP in action | Docs | High | M | P1 |
| 12 | Add CHANGELOG | Docs | Low | S | P2 |
| 13 | Add `/firebase-config` command — guided Firebase project connection | Commands | Medium | M | P2 |
| 14 | Add error recovery section: what to do when `flutter_analyze` returns N errors | Error Handling | Medium | S | P2 |

---

## Sprint Roadmap

### Sprint 1 — Foundation (install.sh + templates + error docs)
P0 items: install.sh, uninstall.sh, .mcp.json.template, common errors in SKILL.md.
After this sprint the plugin is installable and has basic error guidance.

### Sprint 2 — Commands (new commands + deep health)
P1 items: /flutter-new, /flutter-diagnose, Firebase setup guide, GitHub topics.
After this sprint the plugin has real onboarding value.

### Sprint 3 — Polish (docs + discoverability)
P1-P2 items: README demo, CHANGELOG, /firebase-config.
After this sprint plugin is marketplace-ready.

### Target Scores (post Sprint 3)
| Category | Current | Target |
|----------|---------|--------|
| Core Skill | 7.0 | 8.0 |
| Command Quality | 4.0 | 7.5 |
| Setup Experience | 2.5 | 7.0 |
| Error Handling | 3.0 | 7.0 |
| Documentation | 5.0 | 7.5 |
| **Average** | **4.3** | **7.4** |
