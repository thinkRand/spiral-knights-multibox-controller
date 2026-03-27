# 🎮 Spiral Knights Multibox Controller

[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-1.1+-green.svg)](https://www.autohotkey.com/)
[![Spiral Knights](https://img.shields.io/badge/Game-Spiral%20Knights-blue.svg)](https://www.spiralknights.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

&gt; Control multiple Spiral Knights accounts simultaneously from a single keyboard. Originally developed as a freelance project on Fiverr.

---

## ⚠️ Important Warning

This script interacts with Spiral Knights by sending keyboard inputs. Using automation software may violate the game's Terms of Service. **Use at your own risk.** The author is not responsible for any account bans or sanctions. This tool is provided for educational purposes only.

---

## 📑 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Control Modes](#-control-modes)
- [Configuration](#-configuration)
- [Troubleshooting](#-troubleshooting)
- [Repository Structure](#-repository-structure)
- [Changelog](#-changelog)
- [License](#-license)

---

## ✨ Features

- 🎯 **5 different control modes** for various multiboxing needs
- ⚡ **Low latency** (configurable timers down to 1ms)
- 🖥️ **Automatic window detection** (LWJGL class detection)
- 🎹 **Intuitive hotkeys** (TAB to toggle modes)
- 🔧 **Modular code** - easy to customize and extend
- 📊 **Adjustable timing** - fine-tune for your hardware

---

## 📋 Requirements

- Windows 7/8/10/11
- [AutoHotkey 1.1+](https://www.autohotkey.com/download/) (Classic version, **NOT v2**)
- Spiral Knights running in windowed mode (recommended)

---

## 🚀 Installation

1. **Install AutoHotkey** from [autohotkey.com](https://www.autohotkey.com/download/) (Download the "Classic" version)
2. **Download** the desired script from the `/scripts/` folder
3. **Launch Spiral Knights** in as many windows as you need
4. **Run** the `.ahk` file by double-clicking it
5. Follow the mode-specific instructions below

---

## 🎮 Control Modes

### 1. 🎖️ Commander Main (`commander-main.ahk`) ⭐ RECOMMENDED
**Best for:** Playing with one main account + support alts

**How it works:**
- Automatically sets the active window as "Main" (captain)
- All other windows become "Alts" (followers)
- Press `TAB` to toggle commander mode ON/OFF
- When active: WASD keys are sent to alts while you control the main window
- `Ctrl+F12`: Reload window configuration (useful when opening/closing windows)

**Controls:**
```autohotkey
TAB      → Toggle commander mode ON/OFF
WASD     → Movement (synced to alts when commander mode is active)
Ctrl+F12 → Reload window detection
