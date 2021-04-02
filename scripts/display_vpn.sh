#!/usr/bin/env bash

get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

if netstat -nr -f inet | grep utun > /dev/null; then
  echo $(get_tmux_option "@vpn_online_icon" "VPN")""
else
	echo $(get_tmux_option "@vpn_offline_icon" "NO-VPN")""
fi
