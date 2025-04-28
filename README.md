# my-bash-rc

*A personal forge of Bash customizations for Debian 12.*

[![Made For Debian 12](https://img.shields.io/badge/Made%20For-Debian%2012-647687?logo=debian)](https://www.debian.org/)
[![Shell Style](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

This repository contains my personal `.bashrc` configuration, honed and sharpened for daily development rituals on Debian 12.  
It includes essential enhancements, custom environment settings, and powerful helper functions to streamline Java development.

---

## ✨ Features

- Handy shortcuts and environment tweaks
- Java code formatting automation with [google-java-format](https://github.com/google/google-java-format)
- Git integration for automatic formatting of staged and modified Java files

---

## 🛠️ Included Functions

### `gjf`

Format Java files using the latest `google-java-format` JAR available in the current directory.

```bash
gjf file1.java file2.java
```

**How it works:**
- Scans the current working directory for `google-java-format*.jar`.
- If **none** is found: exits with a clear error message.
- If **one** is found: formats the given files automatically.
- If **multiple** are found: interactively prompts the user to choose one.

> **Note:** It modifies files **in-place** using `--replace`.

---

### `gitgjf`

Format all changed or staged Java files in your Git repository.

```bash
gitgjf
```

**How it works:**
- Collects Java files that are added, copied, or modified.
- Formats each file using `gjf`.
- Automatically re-adds the formatted files to the Git index (`git add .`).

No more messy diffs. Every commit: clean, formatted, professional.

---

## 🧠 Usage

1. Clone this repository:

```bash
git clone https://github.com/your-username/my-bash-rc.git
```

2. Append the content of `.bashrc` into your user profile:

```bash
cat my-bash-rc/.bashrc >> ~/.bashrc
source ~/.bashrc
```

3. Place a `google-java-format` JAR file into your working directory.  
Download it from [here](https://github.com/google/google-java-format/releases).

4. Start formatting your Java files:

```bash
gjf MyClass.java
gitgjf
```

---

## 🚀 Future Ideas

- Auto-download `google-java-format` if missing.
- Allow searching for the formatter JAR across custom paths.
- Enhance formatter selection UI with `fzf` or `gum` for smoother UX.

---

## 🤝 Contributing

PRs are welcome. If you find a better way to charm the Bash beast, feel free to fork and suggest.

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🧙 Final Note

This `.bashrc` is not just configuration —  
it's an artifact of craftsmanship, a personal spellbook for the CLI mage.  
Use it, fork it, break it, rebuild it — and make it your own.
