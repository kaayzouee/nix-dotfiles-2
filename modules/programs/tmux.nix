{ config, pkgs, ... }:

{
  # 1. Enable tmux
  programs.tmux = {
    enable = true;
    
    # 2. Basic settings (corresponding to your tricks)
    mouse = true;                # Mouse support (trick 4)
    shortcut = "b";              # Prefix key (Ctrl+b by default)
    baseIndex = 1;              # Window numbers start at 1
    escapeTime = 0;             # Reduce ESC delay
    sensibleOnTop = true;       # Enable sensible plugin for better defaults
    
    # 3. Plugin management (tricks 8, 11, etc.)
    plugins = with pkgs; [
      tmuxPlugins.yank           # System clipboard support (trick 3)
      tmuxPlugins.vim-tmux-navigator # Vim-style pane navigation
      tmuxPlugins.cpu            # Show CPU in status bar (trick 11)
      # Add more plugins here...
    ];
    
    # 4. Custom key bindings and advanced config (all your tricks!)
    extraConfig = ''
      # --- Session switching (trick 1) ---
      bind C-s choose-session -Z
      
      # --- Floating scratchpad (trick 2) ---
      bind C-p new-window -d -n scratch -p 80,60 -c "#{pane_current_path}" "bash"
      
      # --- Mouse toggle (trick 4) ---
      bind m set -g mouse on \; display "Mouse ON"
      bind M set -g mouse off \; display "Mouse OFF"
      
      # --- Pane zoom (trick 5) ---
      bind z resize-pane -Z
      
      # --- Sync panes (trick 6) ---
      bind e set-window-option synchronize-panes
      
      # --- Quick rename (trick 7) ---
      bind , command-prompt "rename-window '%%'"
      bind . command-prompt "rename-pane '%%'"
      
      # --- Show pane numbers (trick 9) ---
      bind q display-panes -d 0
      
      # --- Scrollback search (trick 12) ---
      bind / copy-mode \; send-keys '/'
      bind ? copy-mode \; send-keys '?'
      
      # --- Layout switching (trick 13) ---
      bind Space next-layout
      bind C-Space previous-layout
      
      # --- Nested sessions (trick 14) ---
      bind C-a send-prefix
      
      # --- System clipboard (trick 3, works with yank plugin) ---
      # Set terminal for proper colors
      set -g default-terminal "tmux-256color"
      
      # --- Custom status bar (optional) ---
      # set -g status-right "#[fg=green]#(acpi -b 2>/dev/null | cut -d' ' -f3-4)#[default] %H:%M"
    '';
  };
  
}
