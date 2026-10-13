# ⚡ Kiro Powers

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/kiro-powers)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gvatsal60/kiro-powers/master.svg)](https://results.pre-commit.ci/latest/github/gvatsal60/kiro-powers/HEAD)
[![CodeFactor](https://www.codefactor.io/repository/github/gvatsal60/kiro-powers/badge)](https://www.codefactor.io/repository/github/gvatsal60/kiro-powers)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/kiro-powers)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/kiro-powers)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/kiro-powers)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/kiro-powers)

🎯 A curated collection of [Kiro](https://kiro.dev) **powers** — plugins built on the open [Agent Plugins](https://agent-plugins.org/) spec that give your AI agent instant access to specialized skills and tools. Mention a keyword, and Kiro activates the matching power automatically.

## ✨ Powers

| Power | What it does |
| :--- | :--- |
| 🔄 **java-migration** | Migrate Java projects between JDK versions (8, 11, 17, 21, 25) — build tool updates, breaking-change fixes, and OpenRewrite recipes |

## 📦 Repository Layout

```text
kiro-powers/
├── ⚡ powers/              # Kiro powers (one folder per power)
│   └── java-migration/
│       ├── plugin.json     # Power manifest (Agent Plugins spec)
│       └── skills/         # Agent Skills with SKILL.md
├── 🧩 snippets/            # VS Code snippets (markdown, sh, yaml)
├── 🐳 .devcontainer/       # DevContainer setup
├── 🤖 .github/             # Dependabot and workflows
└── 🛠️ lint configs         # markdownlint, yamllint, pre-commit
```

## 🚀 Installation

1. Open Kiro → **Powers** panel → **Add Custom Power**
2. Choose **Import power from GitHub**
3. Enter: `https://github.com/gvatsal60/kiro-powers`
4. 💡 Or clone locally and use **Import power from a folder**

## 🔄 Updates

Powers panel → power → **Check for updates** → **Install updates**

## 🤝 Contributing

Contributions are welcome! See our
[Contribution Guidelines](https://github.com/gvatsal60/kiro-powers/blob/HEAD/CONTRIBUTING.md)
before submitting pull requests.

## 🛡️ License

Apache License 2.0 — see the
[LICENSE](https://github.com/gvatsal60/kiro-powers/blob/HEAD/LICENSE)
file for details.
