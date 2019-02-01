#!/usr/bin/env bash

SLEEP_DURATION=${SLEEP_DURATION:=1}  # default to 1 second, use to speed up tests

progress-bar() {
  local duration=${1}


  already_done() { for ((done=0; done<elapsed; done=done+1)); do printf "▇"; done }
  remaining() { for ((remain=elapsed; remain<duration; remain=remain+1)); do printf " "; done }
  percentage() { printf "| %s%%" $(( ((elapsed)*100)/(duration)*100/100 )); }
  clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
      already_done; remaining; percentage
      sleep "$SLEEP_DURATION"
      clean_line
  done
  clean_line
}
