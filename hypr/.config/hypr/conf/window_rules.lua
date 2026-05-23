hl.window_rule({ match = { class = "nwg-look" }, float = true, center = true, size = "0 0" })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true, center = true, size = "0 0" })

--[[
hl.window_rule({ match = { class = "^(Ghostty|kitty|Alacritty)$" }, float = true, center = true, size = "monitor_w*0.9 monitor_h*0.85" })
hl.window_rule({ match = { class = "engrampa" }, float = true })
--]]

hl.window_rule({
    match = { class = "org.gnome.FileRoller" },
    float = true,
    center = true,
    size =
    "monitor_w*0.9 monitor_h*0.85"
})
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true, center = true, size = "0 0" })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, center = true, size = "monitor_w*0.7 monitor_h*0.5" })

hl.window_rule({
    match = { class = "thunar", title = "File Operation Progress" },
    float = true,
    center = true,
    size =
    "600 200"
})
hl.window_rule({ match = { class = "thunar", title = "Rename .*" }, float = true, center = true, size = "600 200" })

hl.window_rule({ match = { class = "mirage" }, float = true, center = true, size = "monitor_w*0.9 monitor_h*0.85" })

--[[
hl.window_rule({ match = { class = "pcmanfm" }, float = true })
--]]

hl.window_rule({
    match = { class = "org.vinegarhq.Sober" },
    float = true,
    center = true,
    size = "monitor_w*0.9 monitor_h*0.85",
    content = "game",
    immediate = false
})

hl.window_rule({ match = { class = "chrome-.*" }, fullscreen = true })
hl.window_rule({ match = { class = "brave-.*" }, fullscreen = true })
hl.window_rule({ match = { class = "floorp-.*" }, fullscreen = true })
hl.window_rule({ match = { class = "brave-browser.*" }, fullscreen = 0 })

-- hl.window_rule({ match = { class = "steam" }, float = true, center = true, size = "monitor_w*0.9 monitor_h*0.85", content =
-- "game" })

--[[
hl.window_rule({ match = { class = "clipse" }, float = true, size = "650 250", stay_focused = true, move = "cursor_x cursor_y" })
--]]

hl.window_rule({ match = { class = "^(python3|Tk|Toplevel)$" }, float = true })
hl.window_rule({ match = { class = "^(hyprlock)$" }, no_anim = true })

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true
})

hl.window_rule({ match = { class = "nwg-clipman" }, float = true, center = true, stay_focused = true, dim_around = true })

-- Ignore maximize requests from apps.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })


---
-- Layer rules
---

hl.layer_rule({ match = { namespace = "rofi" }, dim_around = true })
hl.layer_rule({ match = { namespace = "fuzzel" }, dim_around = true })
hl.layer_rule({ match = { class = "waybar" }, blur = true, ignore_alpha = 0.1 })
