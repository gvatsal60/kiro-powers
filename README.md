# ⚡ Kiro Powers

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/kiro-powers)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gvatsal60/kiro-powers/master.svg)](https://results.pre-commit.ci/latest/github/gvatsal60/kiro-powers/HEAD)
[![CodeFactor](https://www.codefactor.io/repository/github/gvatsal60/kiro-powers/badge)](https://www.codefactor.io/repository/github/gvatsal60/kiro-powers)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/kiro-powers)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/kiro-powers)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/kiro-powers)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/kiro-powers)

Welcome to the `Kiro Powers` repository! A curated collection of powers for
[Kiro](https://kiro.dev) — plugins built on the [Agent Plugins](https://agent-plugins.org/)
specification that give your AI agent instant access to specialized tools and
best practices. When you mention relevant keywords, Kiro loads the power's
context and tools automatically. Inside, you'll find:

1. 📄 README.md
2. 📝 LICENSE
3. 🚫 .gitignore
4. 🧑‍🤝‍🧑 CODE_OF_CONDUCT.md
5. ✍️ CONTRIBUTING.md
6. 💰 FUNDING.yml
7. 📜 CHANGELOG.md
8. ⚡ powers/

## 📦 Power Structure

Every power follows the Agent Plugins specification and lives in its own folder:

```
powers/
└── <power-name>/
    ├── plugin.json    # Required manifest (name, version, description, keywords)
    ├── skills/        # Agent Skills with task-specific instructions
    │   └── <skill>/
    │       ├── SKILL.md
    │       ├── scripts/
    │       └── references/
    └── mcp.json       # MCP server configuration (optional)
```

## 🛠️ Installation

Each power lives in its own directory under `powers/` with a `plugin.json`
manifest at its root, so the repository can hold any number of powers.

To use the powers from this repository, just follow these simple steps:

1. **Open Kiro:**
   * Go to the **Powers** panel
   * Select **Add Custom Power**
   * Choose **Import power from GitHub**
   * Enter: `https://github.com/gvatsal60/kiro-powers`
   * Alternatively, clone the repository and choose
     **Import power from a folder**, then select the power directory

2. **Keep powers up to date:**
   * Powers panel → power → **Check for updates** → **Install updates**

3. **Customize According to Your Project:**
   * 🎯 Replace `[Power Name]`
   * 📧 Update `[contact email]`
   * 💡 Follow `[coding style guide]`

## 💬 Contributing

We love contributions! If you'd like to help improve this project, please review our
[Contribution Guidelines](https://github.com/gvatsal60/kiro-powers/blob/HEAD/CONTRIBUTING.md)
before submitting pull requests.

## 🛡️ License

This project is licensed under the Apache License 2.0 License -
see the [LICENSE](https://github.com/gvatsal60/kiro-powers/blob/HEAD/LICENSE)
file for details.
