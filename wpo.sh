#!/usr/bin/bash
current_workspace=$(swaymsg -t get_workspaces | jq '.[]|"focused=\(.focused) name=\(.name) output=\(.output) visible=\(.visible)"' | grep "focused=true")
current_output=$(echo "${current_workspace}" | awk '{split($0, a);split(a[3], b, "=");print b[2];}')
current_name=$(echo "${current_workspace}" | awk '{split($0, a);split(a[2], b, "=");print b[2]}')

new_workspace=$(swaymsg -t get_workspaces | jq '.[]|"focused=\(.focused) name=\(.name) output=\(.output) visible=\(.visible)"' | grep "name=$1")
#OUTPUT_NEW=`echo $WORKSPACES_NEW | awk '{print $3}' | awk -F'=' '{print $2}'`
new_output=$(echo "${new_workspace}" | awk '{split($0, a);split(a[3], output, "=");print output[2]}')
#VISIBLE_NEW=`echo $WORKSPACES_NEW | awk '{print $4}' | awk -F'=' '{print $2}' | awk -F'\"' '{print $1}'`
new_visible=$(echo "${new_workspace}" | awk '{split($0, a);split(a[4], visible, "=");split(visible[2], visible, "\"");print visible[1]}')
#FOCUSED_NEW=`echo $WORKSPACES_NEW | awk '{print $1}' | awk -F'=' '{print $2}'`
new_focused=$(echo "${new_workspace}" | awk '{split($0, a);split(a[1], focused, "=");print focused[2]}')

# If new desired workspace is already focused, just exit
[ "$new_focused" = "false" ] || exit

# If current output and new output are the same
# Or new workspace does not exist
# Just switch workspaces and exit
[[ "${current_output}" = "${new_output}" || -n "${new_workspace}" ]] && swaymsg workspace $1 ; exit

swaymsg move workspace to output $new_output ; swaymsg workspace $1 ; swaymsg move workspace $current_output ; swaymsg workspace ${current_name} ; swaymsg workspace $1 ; exit