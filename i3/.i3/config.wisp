#
# ~/.i3/config.razor
#
# vim: set ft=conf sw=4 ts=4 sts=4 et tw=78 fdm=marker fdl=0 foldmarker={{{,}}} :

# AUTHOR: Guido Masella <guido.masella@gmail.com>

# KEYBINDINGS {{{
bindsym XF86KbdBrightnessDown exec "asuskeyboard.sh down"
bindsym XF86KbdBrightnessUp exec "asuskeyboard.sh up"
bindsym Shift+XF86KbdBrightnessDown exec "xbacklight -dec 10"
bindsym Shift*XF86KbdBrightnessUp exec "xbacklight -inc 20"
# }}}

# WORKSPACES {{{

# outputs
set $O1 eDP1
set $O2 DP1
set $O3 HDMI1

# }}}

# BARS {{{

bar {
	output            $O1
	status_command    i3blocks -c ~/.i3blocks/wisp.conf
	position          bottom
	workspace_buttons yes
    tray_output $O1
    strip_workspace_numbers yes

	font pango:Hack 10, FontAwesome 10, Icons 10

    colors {
        # class    color
        separator  $color8
        background $color0
        statusline $color7
        # class              border   background text
        focused_workspace    $color4  $color4    $color0
        active_workspace     $color8  $color8    $color0
        inactive_workspace   $color0  $color0    $color8
        urgent_workspace     $color1  $color1    $color15
    }
}

bar {
	output            $O2
	status_command    i3blocks -c ~/.i3blocks/wisp.conf
	position          bottom
	workspace_buttons yes
    tray_output $O1
    strip_workspace_numbers yes

	font pango:Hack 10, FontAwesome 10, Icons 10

    colors {
        # class    color
        separator  $color8
        background $color0
        statusline $color7
        # class              border   background text
        focused_workspace    $color4  $color4    $color0
        active_workspace     $color8  $color8    $color0
        inactive_workspace   $color0  $color0    $color8
        urgent_workspace     $color1  $color1    $color15
    }
}
# }}}

# AUTOSTART {{{
exec --no-startup-id blueman-applet
# }}}
