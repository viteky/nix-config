# Imports
import os
import subprocess
import platform
from libqtile import bar, layout, extension, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration, RectDecoration
import colors

mod = "mod4"
terminal = "alacritty"
browser = "firefox"
editor = "nvim"
hostname = platform.uname().node

#########################
#       Keybindings     #
#########################

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(["mod1"], "Tab", lazy.spawn("rofi -show window -show-icons"), desc="Open window switcher"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod],"f",lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on the focused window",),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show drun -show-icons"), desc="Spawn a command using a prompt widget"),
]

#########################
#        Groups         #
#########################


groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = [" ", " ", "󰍹 ", "󰈙 ", " ", "󰭹 ", " ", " ", "󰊗 "]
group_layouts = ["MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall", "MonadTall"]

for i in range(len(group_names)):
    groups.append(
        Group(
            name = group_names[i],
            label = group_labels[i],
            layout = group_layouts[i].lower(),
        ))

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

#########################
#       Layouts         #
#########################
colors = colors.Dracula

layout_theme = {"border_width": 4,
                "margin": 10,
                "border_focus": colors[7],
                "border_normal": colors[6]
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    #layout.Stack(**layout_theme, num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(**layout_theme),
]


#########################
#        Widgets        #
#########################

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=3
)
extension_defaults = widget_defaults.copy()
decoration_group = {
    "decorations": [
        RectDecoration(colour=colors[0], radius=10, filled=True, padding_y=4, group=True)
    ],
    "padding": 10,
}

def init_widgets_list():
    widgets_list = [
        widget.TextBox(
                 text = '  ',
                 fontsize = 24,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show drun -show-icons")},
                 ),
        widget.CurrentLayoutIcon(
                 custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                 foreground = colors[1],
                 padding = 0,
                 scale = 0.7
                 ),
        widget.Spacer(length = bar.STRETCH),
        widget.GroupBox(
                 font = "JetBrainsMono Nerd Font",
                 fontsize = 20,
                 margin_y = 3,
                 margin_x = 4,
                 padding_y = 2,
                 padding_x = 3,
                 borderwidth = 3,
                 active = colors[8],
                 inactive = colors[1],
                 rounded = False,
                 highlight_color = colors[2],
                 highlight_method = "text",
                 this_current_screen_border = colors[7],
                 this_screen_border = colors [4],
                 other_current_screen_border = colors[7],
                 other_screen_border = colors[4], 
                 **decoration_group
                 ),
        widget.Spacer(length = bar.STRETCH),
        widget.PulseVolume(
                 #foreground = colors[7],
                 #fmt = ' {}',
                 emoji = 'True',
                 emoji_list = ['󰝟', '󰕿', '󰖀', '󰕾'],
                 fontsize = 20,
                 mode = 'icon',
                 **decoration_group
                 ),
        widget.UPowerWidget(
            battery_height = 10,
            battery_width = 20,
            **decoration_group,
            ),
        widget.WiFiIcon(
            **decoration_group
        ),
        widget.Clock(
                 format = "%d/%m/%y - %I:%M%p",
                 **decoration_group
                 ),
        widget.Spacer(length = 8),
        widget.TextBox(
                 text = '󰐥 ',
                 fontsize = 24,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show power-menu -show-icons")},
                 ),       
        ]
    return widgets_list

# Monitor 1 will display ALL widgets in widgets_list. It is important that this
# is the only monitor that displays all widgets because the systray widget will
# crash if you try to run multiple instances of it.
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1 

# All other monitors' bars will display everything but widgets 22 (systray) and 23 (spacer).
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[22:24]
    return widgets_screen2

# For adding transparency to your bar, add (background="#00000000") to the "Screen" line(s)
# For ex: Screen(top=bar.Bar(widgets=init_widgets_screen2(), background="#00000000", size=24)),

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=40, background="#00000000")),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=40, background="#00000000")),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=40, background="#00000000"))
           ]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = True
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus =colors[7],
    border_normal =colors[6],
    border_width = 4,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.client_new
def new_client(client):
    if client.wm_class == "firefox":
        client.togroup("1")


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
