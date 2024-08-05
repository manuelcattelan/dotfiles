set -g mode-style "fg=#7aa2f7,bg=#3b4261"

set -g message-style "fg=#7aa2f7,bg=#3b4261"
set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#7aa2f7"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#7aa2f7,bg=#16161e"

set -g status-left-style NONE
set -g status-left-length "100"
set -g status-left "#[fg=#15161e,bg=#7aa2f7,bold] SESSION: [#S] "

set -g status-right-style NONE
set -g status-right-length "100"
set -g status-right "#[fg=#15161e,bg=#7aa2f7,bold] EXEC: [#W] "

setw -g window-status-separator ""

setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"

setw -g window-status-format "#[default] [#I] #{b:pane_current_path} #F "
setw -g window-status-current-format "#[fg=#7aa2f7,bg=#3b4261,bold] [#I] #{b:pane_current_path} #F "
