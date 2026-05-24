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

1. Close JDownloader 2 completely
2. Copy `flatlaf.jar` to `JDownloader 2\libs\laf\` — replace the existing file
3. Create `JDownloader 2\cfg\laf\` if it doesn't exist, then copy `FlatDarkLaf.json` there
4. Copy the contents of the `images\` folder to `JDownloader 2\themes\standard\org\jdownloader\images\` — replace when prompted
5. Open JDownloader 2
6. Go to `Settings → Advanced Settings`
7. Search for `LookAndFeelTheme`
8. Set `GraphicalUserInterfaceSettings: Look And Feel Theme` to `FLATLAF_DARK`
9. Restart JDownloader 2

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

- The official JDownloader 2 logo icon intentionally retains its original orange/yellow color as a visual anchor and out of respect for the JDownloader project.
- Tested on Windows 10/11. Should work on Linux and macOS with path adjustments.
- If you use the theme on Linux via Flatpak or AUR builds of JDownloader, the `vmoptions` file may not be recognized — use the official installer from jdownloader.org instead.
