# Umbriel Submap

A Noctalia bar widget that displays the active keybind submap of the [Umbriel](https://github.com/umbriel-wm/umbriel) compositor.

## Features

- Displays the currently active keybind submap.
- Optionally remains visible when no submap is active.
- Configurable glyph and color through the Noctalia bar configuration.
- Automatically hides when no submap is active and `always_visible` is disabled.

## Requirements

- [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) v5
- [Umbriel](https://github.com/umbriel-wm/umbriel) compositor and its `umbriel` CLI.

## Configuration

Add the widget to your Noctalia bar configuration:

```toml
[widget.umbriel-submap]
type = "execnull/umbriel-submap:bar"
always_visible = false
show_glyph = true
glyph = "map-route"
color = "secondary"
```

- `always_visible`: Keep the widget visible when no submap is active.
- `show_glyph`: Show or hide the widget glyph.
- `glyph`: Glyph to display.
- `color`: Foreground color, using Noctalia's supported color names.

## How it works

The widget subscribes to Umbriel's submap IPC event stream and updates its label whenever the active submap changes.
