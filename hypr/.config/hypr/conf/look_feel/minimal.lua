hl.config({
    general = {
        gaps_in          = 0,
        gaps_out         = 0,

        border_size      = 0,

        col              = {
            active_border   = "rgba(ffffffff)",
            inactive_border = "rgba(000000ff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = true,

        layout           = "scrolling",
    },

    decoration = {
        rounding         = 0,
        rounding_power   = 0,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow           = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = false,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    }
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
