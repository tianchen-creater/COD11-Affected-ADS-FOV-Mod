# Call of Duty: Advanced Warfare - Affected ADS FOV Mod
《使命召唤11：高级战争》开镜等比关联视野增强模组

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)]()
[![Game](https://img.shields.io/badge/Game-CoD%3A%20Advanced%20Warfare%20(v1.22)-orange.svg)]()

A standalone, lightweight quality-of-life mod for the **Call of Duty: Advanced Warfare** singleplayer campaign (`s1_sp64_ship.exe`). It solves the notorious motion sickness issue where third-party FOV changers only increase hipfire FOV while aiming down sights (ADS) abruptly drops back to the narrow 65° default.

一个为《使命召唤：高级战争》单人战役设计的开箱即用独立视野模组。彻底解决以往单人战役修改器仅修改腰射视角，一开镜就骤降回 65° 原版视角导致严重 3D 眩晕的问题。

---

## 🌟 Background & Mechanism / 背景与原理解析

### The Problem / 旧版工具的问题
In older Call of Duty titles prior to *Modern Warfare (2019)*, ADS FOV was strictly "Independent". Legacy FOV fixes (such as Gollum's `CodAwSpFovFix`) only modified `cg_fov` (`s1_sp64_ship.exe+01381A70 + 0x10`). When aiming down sights, the camera interpolation pipeline overrides FOV with weapon target zoom (typically 55°), creating a massive 35°~45° sudden focal drop in 0.2 seconds and causing severe motion sickness.

在 MW2019 之前，COD 引擎默认采用“独立开镜视角”。早期社区工具仅修改了基础变量 `cg_fov`，开镜时引擎仍会把视角压缩回 55°，短时间内的大幅焦距突变是导致玩家头晕眼花的主要原因。

### The Solution / 本模组的解决方案
Through reverse engineering the engine's `CG_CalcFov` rendering routine, we located the native engine scaling variable **`cg_playerFovScale0`** (`s1_sp64_ship.exe+01381A98 + 0x10`). 
By applying a global multiplier directly to this native dvar, both hipfire and ADS zoom are proportionally scaled:
- $\text{Hipfire FOV} = 65^\circ \times \text{Scale}$
- $\text{ADS FOV} = 55^\circ \times \text{Scale}$

This delivers a natural, smooth "Affected FOV" experience with zero code hooks and 100% engine stability.

---

## 🎮 Hotkey Controls / 快捷键档位

| Hotkey (小键盘按键) | Hipfire FOV (腰射) | Iron Sights ADS (机瞄) | Description (说明) |
| :---: | :---: | :---: | :--- |
| **Numpad 0** | **65°** | **55°** | Default stock FOV (原版默认) |
| **Numpad 1** | **80°** | **68°** | Slight wide FOV (微广角) |
| **Numpad 2** | **90°** | **76°** | **Recommended Default ★ (黄金推荐)** |
| **Numpad 3** | **95°** | **80°** | Comfortable wide (开阔舒适) |
| **Numpad 4** | **100°** | **85°** | Modern competitive feel (现代竞技手感) |
| **Numpad 5** | **105°** | **89°** | Ultra wide (大广角) |
| **Numpad 6** | **110°** | **93°** | 21:9 Ultrawide display (超宽带鱼屏推荐) |
| **Numpad 7** | **120°** | **102°** | Maximum wide (极限广角) |
| **Numpad +** | **+2 FOV** | - | Fine tune increase (微调增加) |
| **Numpad -** | **-2 FOV** | - | Fine tune decrease (微调减少) |

*Sound cues (auditory feedback) will beep with distinct pitches upon pressing hotkeys in-game.*  
*每次按键切换均有不同音调的清脆提示音，游戏内无需切屏即可得知当前档位。*

---

## 🚀 Quick Start / 快速上手

1. Download the latest `COD11_Affected_FOV_Fix.exe` from [Releases](https://github.com/your-username/COD11-Affected-ADS-FOV-Mod/releases).
2. Launch the game and enter a campaign mission.
3. Run `COD11_Affected_FOV_Fix.exe` (run as Administrator).
4. Return to game and press **Numpad 0 ~ 7** to switch FOV on the fly!

> **Cheat Engine Users**: If you prefer Cheat Engine, a pre-configured `.CT` table with hotkeys is also provided in the [`cheat_table/`](cheat_table/) directory.

---

## ⚠️ Notes & Compatibility / 注意事项

1. **Game Version**: Tested and designed for **v1.22.0.1** (Final patch release on Steam and mainstream repacks).
2. **Antivirus False Positives**: Modifying process memory via `WriteProcessMemory` might trigger false-positive warnings in heuristic antivirus engines. Please add it to your security software's whitelist.
3. **NumLock**: Make sure your keyboard's **NumLock** LED is turned ON.
4. **No Conflicting Trainers**: Please close older FOV fixers (e.g. `CodAwSpFovFix`) or Cheat Engine freeze scripts before running this mod.

---

## 🛠️ Building from Source / 源码编译

```bash
git clone https://github.com/your-username/COD11-Affected-ADS-FOV-Mod.git
cd COD11-Affected-ADS-FOV-Mod
pip install pyinstaller
build.bat
```

The output executable will be generated in `dist/COD11_Affected_FOV_Fix.exe`.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
