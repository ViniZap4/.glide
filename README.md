# macOS Tiling WM

Tiling window management on macOS with vim motions, smooth animations, and window borders.

Built with [yabai](https://github.com/koekeishiya/yabai) + [skhd](https://github.com/koekeishiya/skhd) + [JankyBorders](https://github.com/FelixKratz/JankyBorders).

## Install

```bash
git clone https://github.com/ViniZap4/macos-tiling-wm.git
cd macos-tiling-wm
./install.sh
```

Then grant **Accessibility** permissions to `yabai` and `skhd`:

**System Settings > Privacy & Security > Accessibility**

## Animations (optional)

Smooth window animations require the yabai scripting addition, which needs SIP partially disabled:

1. Shut down your Mac
2. Boot into Recovery Mode (hold power button)
3. Open Terminal and run:
   ```
   csrutil disable --with kext --with dtrace --with basesystem
   ```
4. Reboot, then configure sudoers:
   ```bash
   echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
   ```
5. Restart yabai:
   ```bash
   yabai --restart-service
   ```

## Keybindings

All keybindings use `alt` (option) as the modifier.

### Window Focus

| Keys | Action |
|------|--------|
| `alt + h` | Focus left |
| `alt + j` | Focus down |
| `alt + k` | Focus up |
| `alt + l` | Focus right |
| `alt + n` | Focus next window |
| `alt + p` | Focus previous window |

### Window Movement

| Keys | Action |
|------|--------|
| `shift + alt + h/j/k/l` | Swap window |
| `ctrl + alt + h/j/k/l` | Warp window into container |
| `shift + alt + arrows` | Resize window |

### Layout

| Keys | Action |
|------|--------|
| `alt + f` | Toggle fullscreen |
| `alt + t` | Toggle float (centered) |
| `alt + e` | Toggle split direction |
| `alt + r` | Rotate layout |
| `alt + y` | Mirror y-axis |
| `alt + x` | Mirror x-axis |
| `shift + alt + 0` | Balance all windows |

### Workspaces

| Keys | Action |
|------|--------|
| `alt + 1-9` | Focus workspace |
| `shift + alt + 1-9` | Move window to workspace |
| `ctrl + alt + 1-3` | Focus monitor |
| `ctrl + shift + alt + 1-3` | Move window to monitor |

### Other

| Keys | Action |
|------|--------|
| `alt + q` | Close window |
| `ctrl + alt + r` | Restart yabai |

## Mouse

| Action | Binding |
|--------|---------|
| Move window | `alt + left click drag` |
| Resize window | `alt + right click drag` |
| Swap on drop | Drag window onto another |

## Structure

```
yabai/yabairc       # Window manager config (layout, gaps, animations, app rules)
skhd/skhdrc         # Keybindings with vim motions
borders/bordersrc   # Active/inactive window border colors
install.sh          # One-command setup
```
