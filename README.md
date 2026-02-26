# macOS Tiling WM

Tiling window management on macOS with vim motions and smooth animations. No SIP disable required.

Built with [Glide](https://github.com/glide-wm/glide) — a tiling window manager inspired by i3, Sway, and Hyprland.

## Install

```bash
git clone https://github.com/ViniZap4/macos-tiling-wm.git
cd macos-tiling-wm
./install.sh
```

Then grant **Accessibility** permissions to `Glide`:

**System Settings > Privacy & Security > Accessibility**

Press `Alt+Z` on any space to activate tiling.

## Keybindings

All keybindings use `alt` (option) as the modifier.

### Window Focus

| Keys | Action |
|------|--------|
| `alt + h` | Focus left |
| `alt + j` | Focus down |
| `alt + k` | Focus up |
| `alt + l` | Focus right |

### Window Movement

| Keys | Action |
|------|--------|
| `alt + shift + h/j/k/l` | Move window |
| `alt + ctrl + h/j/k/l` | Resize window (5%) |

### Layout

| Keys | Action |
|------|--------|
| `alt + f` | Toggle fullscreen |
| `alt + shift + space` | Toggle float |
| `alt + space` | Toggle focus floating windows |
| `alt + \` | Split horizontal |
| `alt + =` | Split vertical |
| `alt + t` | Group tabbed |
| `alt + s` | Group stacked |
| `alt + e` | Ungroup |

### Tree Navigation

| Keys | Action |
|------|--------|
| `alt + a` | Ascend (select parent) |
| `alt + d` | Descend (select child) |
| `alt + n` | Next layout |
| `alt + p` | Previous layout |

### Other

| Keys | Action |
|------|--------|
| `alt + z` | Activate/deactivate tiling on space |
| `alt + shift + e` | Save state & exit |
| `alt + shift + d` | Debug (print layout) |

## Mouse

| Action | Binding |
|--------|---------|
| Focus window | Move mouse over window |
| Mouse follows focus | Automatic |

## Structure

```
glide/glide.toml    # Window manager config (layout, gaps, animations, keybindings)
install.sh          # One-command setup
```
