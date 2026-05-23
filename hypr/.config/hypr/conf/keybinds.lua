-- DEFAULT APPS --

local terminal = "$(cat ~/.config/hypr/vars/terminal)"
local file_manager = "nemo"
local menu = "$(cat ~/.config/hypr/vars/launcher)"
local browser = "helium-browser"
local browser_alt = "helium-browser --incognito"
local task_manager = "resources"
local editor = terminal .. " -e nvim"
local ide = "zeditor"

-- BINDS --

-- APPS
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(browser_alt))
hl.bind("SUPER + N", hl.dsp.exec_cmd("gnome-text-editor"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd(ide))
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(task_manager))
hl.bind("SUPER + C", hl.dsp.exec_cmd("nwg-clipman -w"))
hl.bind("SUPER + O", hl.dsp.exec_cmd(terminal .. " -e opencode"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(editor))
hl.bind("SUPER + P", hl.dsp.exec_cmd("nwg-dislpays"))

-- ACTIONS
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("ALT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- SCRIPTS
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/configuration.sh"))
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/powermenu.sh"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.sh"))
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("~/.config/hypr/scripts/rofi-window-switcher.sh"))
hl.bind("SUPER + S", hl.dsp.exec_cmd(terminal .. " -e ~/.config/hypr/scripts/search.sh"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-waybar.sh"))

-- MOVE FOCUS
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }))

-- RESIZE FLOATING WINDOWS
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + LEFT", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + UP", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + DOWN", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

-- MOVE ACTIVE WINDOW
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))

-- SWITCH WORKSPACE
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- SCROLL THROUGH WORKSPACES
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- MOVE WITH MOUSE
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- LAPTOP BINDINGS
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && ~/.config/hypr/scripts/osd-volume.sh"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ~/.config/hypr/scripts/osd-volume.sh"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ~/.config/hypr/scripts/osd-volume.sh"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- PLAYERCTL CONTROLS
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
