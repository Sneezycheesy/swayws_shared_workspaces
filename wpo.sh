#!/usr/bin/bash
WORKSPACES_CURRENT=`swaymsg -t get_workspaces | jq '.[]|"focused=\(.focused) name=\(.name) output=\(.output) visible=\(.visible)"' | grep "focused=true"`
OUTPUT_CURRENT=`echo $WORKSPACES_CURRENT | awk '{print $3'} | awk -F'=' '{print $2}'`
WORKSPACE_CURRENT_NAME=`echo $WORKSPACES_CURRENT | awk '{print $2}' | awk -F'=' '{print $2}'`

WORKSPACES_NEW=`swaymsg -t get_workspaces | jq '.[]|"focused=\(.focused) name=\(.name) output=\(.output) visible=\(.visible)"' | grep "name=$1"`
OUTPUT_NEW=`echo $WORKSPACES_NEW | awk '{print $3}' | awk -F'=' '{print $2}'`
VISIBLE_NEW=`echo $WORKSPACES_NEW | awk '{print $4}' | awk -F'=' '{print $2}' | awk -F'\"' '{print $1}'`
FOCUSED_NEW=`echo $WORKSPACES_NEW | awk '{print $1}' | awk -F'=' '{print $2}'`

if [[ "$FOCUSED_NEW" != "true"  ]]; then
    if [[ "$VISIBLE_NEW" != "true" ]]; then
	swayws move $1 $OUTPUT_CURRENT && swayws focus $1
    else
	swayws move "$WORKSPACE_CURRENT_NAME" "$OUTPUT_NEW" ; swayws move "$1" "$OUTPUT_CURRENT" ; swayws focus $1
    fi
fi
