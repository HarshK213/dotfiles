if status is-interactive
# Commands to run in interactive sessions can go here
	set -g fish_greeting ""
	#	fastfetch
	starship init fish | source
	alias ff="fastfetch -c ~/.config/fastfetch/logo.jsonc  ;  fastfetch -c ~/.config/fastfetch/config.jsonc"
	alias zed="zeditor"

	set -Ux PYENV_ROOT $HOME/.pyenv
	fish_add_path $PYENV_ROOT/bin
	status --is-interactive; and pyenv init - | source
end
