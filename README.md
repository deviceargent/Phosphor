# Phosphor — A Dark Neon Theme for JDownloader 2

A neon green terminal-style theme for JDownloader 2. Inspired by CRT phosphor monitors, Matrix, and Fallout terminals.

![Downloads tab](screenshots/downloads.png)
![Settings panel](screenshots/settings.png)
![Preview](screenshots/preview.png)

---

## What it looks like

- Near-black backgrounds (`#0e0e0e`) with layered dark surfaces
- Neon green (`#39ff7a`) accent on selected rows, progress bars, tabs, icons
- Monochromatic green icon set
- Full dark chrome — menus, toolbars, scrollbars, checkboxes, tooltips

---

## Files

| File | Destination |
|---|---|
| `flatlaf.jar` | `JDownloader 2\libs\laf\` |
| `FlatDarkLaf.json` | `JDownloader 2\cfg\laf\` (create folder if missing) |
| `images\` (folder contents) | `JDownloader 2\themes\standard\org\jdownloader\images\` |

---

## Installation
0. Go to Code ( Green button up here )  > Download Zip File
1. Right click Jdownloader 2 shortcut on your desktop or start menu and open > Properties , then > Open File location
2. Open the zip file you just downloaded
3. Close JDownloader 2 completely
4. Copy `flatlaf.jar` to `JDownloader 2\libs\laf\` — replace the existing file
5. Create `JDownloader 2\cfg\laf\` if it doesn't exist, then copy `FlatDarkLaf.json` there
6. Copy the contents of the `images\` folder to `JDownloader 2\themes\standard\org\jdownloader\images\` — replace when prompted
7. Open JDownloader 2
8. Go to `Settings → Advanced Settings`
9. Search for `LookAndFeelTheme`
10. Set `GraphicalUserInterfaceSettings: Look And Feel Theme` to `FLATLAF_DARK`
11. Restart JDownloader 2

### After a JDownloader update

JDownloader may overwrite `flatlaf.jar` after an automatic update. If the theme reverts, simply copy `flatlaf.jar` back to `libs\laf\` and restart.

It's a good idea to keep a backup of the three files somewhere easy to find.

---

## Paths by OS

**Windows:**
```
%LOCALAPPDATA%\JDownloader 2\libs\laf\
%LOCALAPPDATA%\JDownloader 2\cfg\laf\
%LOCALAPPDATA%\JDownloader 2\themes\standard\org\jdownloader\images\
```

**Linux:**
```
~/JDownloader2/libs/laf/
~/JDownloader2/cfg/laf/
~/JDownloader2/themes/standard/org/jdownloader/images/
```

**macOS:**
```
~/Library/JDownloader 2/libs/laf/
~/Library/JDownloader 2/cfg/laf/
~/Library/JDownloader 2/themes/standard/org/jdownloader/images/
```

---

## Credits

**FlatLaf** — Java Swing Look and Feel library  
© JFormDesigner GmbH  
Licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)  
https://www.formdev.com/flatlaf/

**Icon set** — Based on material-darker-jdownloader by moktavizen  
Licensed under the [MIT License](https://opensource.org/licenses/MIT)  
https://github.com/moktavizen/material-darker-jdownloader  
Icons recolored to neon green (#39ff7a) for this theme.

**Theme colors and FlatDarkLaf.json** — Phosphor theme  
Original work, free to use and redistribute.

---

## License

Phosphor is distributed under the [MIT License](https://opensource.org/licenses/MIT).

The bundled `flatlaf.jar` retains its original Apache 2.0 license.  
The icon set retains its original MIT license from moktavizen.

---

## Notes

&ensp;

👤 <ins>Author</ins>

DeviceArgent 

![ArgentinaFlorkGIF](https://github.com/user-attachments/assets/1564ac6d-7b0b-4c0b-8f82-5bd3a9b69edb)


- The official JDownloader 2 logo icon intentionally retains its original orange/yellow color as a visual anchor and out of respect for the JDownloader project.
- Tested on Windows 10/11. Should work on Linux and macOS with path adjustments.
- If you use the theme on Linux via Flatpak or AUR builds of JDownloader, the `vmoptions` file may not be recognized — use the official installer from jdownloader.org instead.
