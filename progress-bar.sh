#!/usr/bin/env bash

: "${SLEEP_DURATION:=1}"  # default to 1 second, use to speed up tests

: "${BAR_FILL:=▇}"        # Make sure both BAR_FILL and BAR_EMPTY have
: "${BAR_EMPTY:= }"       # the same number of characters.

progress-bar() {
  local duration
  local columns
  local space_available
  local fit_to_screen  
  local space_reserved

  space_reserved=6   # reserved width for the percentage value
  duration=${1}
  columns=$(tput cols)
  space_available=$(( columns-space_reserved ))
  fit_to_screen=$(( (duration / space_available) + 1 ))

  already_done() { for ((done=0; done<(elapsed / fit_to_screen) ; done=done+1 )); do printf '%b' "$BAR_FILL"; done }
  remaining() { for (( remain=(elapsed/fit_to_screen) ; remain<(duration/fit_to_screen) ; remain=remain+1 )); do printf '%b' "$BAR_EMPTY"; done }
  percentage() { printf "| %s%%" $(( (elapsed*100)/duration )); }
  clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
      already_done; remaining; percentage
      sleep "$SLEEP_DURATION"
      clean_line
  done
  clean_line
}
