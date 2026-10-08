-- Layer Rules
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

-- Keybinds
local mod = "SUPER"

-- Application Launchers
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("uwsm app -- kitty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("uwsm app -- nautilus"))

-- Audio Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })

-- Brightness Controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { locked = true, repeating = true })

hl.bind(mod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true, drag = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. "+Q", hl.dsp.window.close())
hl.bind(mod .. "+F", hl.dsp.window.fullscreen())
hl.bind(mod .. "+T", hl.dsp.window.float())

local directions = { left = "l", right = "r", up = "u", down = "d" }
for key, direction in pairs(directions) do
  hl.bind(mod .. "+" .. key, hl.dsp.focus({ direction = direction }))
  hl.bind(mod .. "+SHIFT+" .. key, hl.dsp.window.move({ direction = direction }))
  -- hl.bind(mod .. " + CTRL + " .. key, hl.dsp.window.resize({ direction = direction }))
end

for i = 1, 10 do
  local key = i % 10
  hl.bind(mod .. "+ " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
  hl.bind(mod .. "+SHIFT+" .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. "+ESCAPE", hl.dsp.workspace.toggle_special("sysmon"))
hl.bind(mod .. "+G", hl.dsp.workspace.toggle_special("gaming"))

---
--- Noctalia binds
---

local ipc = "noctalia msg "

-- Core binds
hl.bind(mod .. "+Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mod .. "+S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind(mod .. "+L", hl.dsp.exec_cmd(ipc .. "session lock"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { locked = true, repeating = true })

hl.config({
  general = {
    resize_on_border = false,
    allow_tearing = false,
    layout = "master",
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,
  },
  decoration = {
    rounding = 0,
    rounding_power = 2,
    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
  input = {
    follow_mouse = 2,
  },
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,
    -- float_force_onscreen = 2,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    middle_click_paste = true,
  },
  binds = {
    drag_threshold = 10, -- Fire a drag event only after dragging for more than 10px
    hide_special_on_workspace_change = true,
  },
  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },
  xwayland = {
    force_zero_scaling = true,
  },
})

-- Monitor Configuration

hl.monitor({
  output = "desc:ASUSTek COMPUTER INC VG279QM L9LMQS114293",
  mode = "1920x1080@280.00",
  position = "2048x0",
})

hl.monitor({
  output = "desc:ASUSTek COMPUTER INC VG27A LBLMQS262134",
  mode = "2560x1440@165.00",
  position = "0x0",
  scale = 1.25,
})

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60.00",
  position = "0x0",
  scale = 1.25,
})

-- Startup Commands

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Workspace Rules

hl.workspace_rule({ workspace = "special:sysmon", on_created_empty = "kitty -e btop" })
hl.workspace_rule({ workspace = "special:gaming" })

-- Window Rules

hl.window_rule({
  match = { class = "(pinentry-)(.*)" },
  stay_focused = true,
})
hl.window_rule({
  match = { class = "dev.noctalia.Noctalia" },
  float = true,
  size = { 1080, 920 },
})
hl.window_rule({
  match = { class = "^(firefox)$" },
  workspace = 1,
})
hl.window_rule({
  match = { class = "^(code)$" },
  workspace = 2,
})
hl.window_rule({
  match = { class = "^(obsidian|libreoffice.*)$" },
  workspace = 4,
})
hl.window_rule({
  match = { class = "^(spotify)$" },
  workspace = 5,
})

hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { title = "^(*scrcpy*)$" }, float = true })
hl.window_rule({ match = { class = "^(org.gnome.*)$" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
