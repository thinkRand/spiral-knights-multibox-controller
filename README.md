# 🎮 Spiral Knights Multibox Controller

[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-1.1+-green.svg)](https://www.autohotkey.com/)
[![Spiral Knights](https://img.shields.io/badge/Game-Spiral%20Knights-blue.svg)](https://www.spiralknights.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> Control multiple Spiral Knights accounts simultaneously from a single keyboard. Originally developed as a freelance project on Fiverr.

---

## ⚠️ Important Warning

This script interacts with Spiral Knights by sending keyboard inputs. Using automation software may violate the game's Terms of Service. **Use at your own risk.** The author is not responsible for any account bans or sanctions. This tool is provided for educational purposes only.
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
```

---

### 2. ⚔️ Commander Simple (`commander-simple.ahk`)
**Best for:** Quick control without main/alt distinction

- Similar to Commander Main but without differentiating between windows
- Sends keys to ALL windows except the active one
- Lighter and simpler than the main version
- No toggle mode - always active

---

### 3. 🛡️ Squad Precise (`squad-precise.ahk`)
**Best for:** Perfect movement synchronization

- Uses separate `key down` / `key up` system for maximum precision
- Very fast timing (1ms between inputs)
- Best for movements requiring exact timing
- Uses polling loops with `GetKeyState`

**Configurable variables:**
```autohotkey
duracionDepresion := 50    ; How long to hold each key (ms)
tiempoEntreEntradas := 1   ; Delay between inputs (ms)
```

---

### 4. 🥇 Squad Classic (`squad-classic.ahk`)
**Best for:** General stable usage

- First version of the squadron mode
- More conservative timing (7ms between inputs)
- Greater stability on slower PCs
- Good balance between responsiveness and CPU usage

---

### 5. 🔄 Mimic Toggle (`mimic-toggle.ahk`)
**Best for:** Automatic/simple movements

- Each key is an independent toggle switch
- Press 'W' once → starts walking forward in all windows continuously
- Press 'W' again → stops
- No need to hold keys down - great for AFK farming or simple patterns
- Uses `SetTimer` with 15ms intervals

---

## ⚙️ Configuration

### Global Variables (apply to most scripts):

| Variable | Description | Default Value | Recommended Range |
|----------|-------------|---------------|-------------------|
| `duracionDepresion` | How long a key stays pressed | 50ms | 30-100ms |
| `tiempoEntreEntradas` | Delay between sending to windows | 1-7ms | 0-10ms |
| `SetBatchLines` | Script execution speed | -1 | Don't change |
| `Process Priority` | Process priority level | High | High/Normal |

### Adjusting timing for your PC:

If movements don't synchronize well:

1. **Increase** `duracionDepresion` if characters don't move far enough
2. **Decrease** `tiempoEntreEntradas` if there's too much delay between windows
3. **Increase** `tiempoEntreEntradas` if your PC lags or stutters

**Example for slower PCs:**
```autohotkey
duracionDepresion := 80
tiempoEntreEntradas := 10
```

**Example for fast PCs:**
```autohotkey
duracionDepresion := 30
tiempoEntreEntradas := 0
```

---

## 🐛 Troubleshooting

### Windows not detected
- Make sure Spiral Knights is running **BEFORE** starting the script
- Verify the game uses class `LWJGL` (you can use AutoHotkey's Window Spy tool)
- Try running the script as Administrator

### Keys not sending to secondary windows
- Windows must be in **windowed mode** (not exclusive fullscreen)
- Some windows need to have focus at least once to receive messages properly
- Try clicking each window once before starting

### Erratic movement or lag
- Increase `tiempoEntreEntradas` in the script
- Reduce the number of simultaneous windows
- Close other CPU-intensive programs
- Lower the priority in Task Manager if needed

### "Call to nonexistent function" error
- You're using AutoHotkey v2. **Download version 1.1** (Classic) from the website

### Characters move at different speeds
- This is normal due to game physics and network latency
- Try adjusting `tiempoEntreEntradas` to find the sweet spot for your setup
---

## 💡 Tips for Best Results

- **Use windowed mode** - Fullscreen exclusive often blocks synthetic inputs
- **Same resolution** - Keep all game windows at the same resolution for consistency
- **Test timing** - Every PC is different; spend 5 minutes finding your ideal settings
- **Start small** - Test with 2 windows before trying 5+
- **Check CPU usage** - If your PC struggles, increase `tiempoEntreEntradas`

---

⭐ **Star this repo if it helped you!** ⭐  

### `docs/CONFIGURATION.md`
```markdown
# Configuration Guide

## Understanding the Variables

### `duracionDepresion` (Key Press Duration)
Controls how long each key stays physically "pressed" in the game.

- **Too low (10-20ms):** Game may not register the keypress
- **Optimal (40-60ms):** Good balance for most PCs
- **Too high (100ms+):** Characters may move too far, harder to control

### `tiempoEntreEntradas` (Input Delay)
Controls the delay between sending keystrokes to different windows.

- **0ms:** Fastest, but may overload slow PCs
- **1-5ms:** Good for modern PCs
- **10ms+:** Safer for older hardware, but less synchronized

## Mode Selection Guide

| Scenario | Recommended Mode | Why |
|----------|-----------------|-----|
| 1 main + 2-3 alts | `commander-main.ahk` | Full control over main while alts follow |
| All alts, no main | `commander-simple.ahk` | Simple, no toggle needed |
| Precise boss fights | `squad-precise.ahk` | Exact timing for dodging |
| AFK farming | `mimic-toggle.ahk` | Set and forget movement |
