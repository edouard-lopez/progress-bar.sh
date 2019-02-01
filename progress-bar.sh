#!usr/bin/env bash

SLEEP_DURATION=${SLEEP_DURATION:=1}  # default to 1 second, use to speed up tests

progress-bar() {

  local duration=${1}
  local columns=$(tput cols)
  local spaceAvailable=$((columns-5))
 
  if (( duration <= spaceAvailable )); then factor=1;
  else factor=$((duration/spaceAvailable));
  fi
   	
  already_done() { for ((done=0; done< (elapsed/factor) ; done=done+1)); do printf "▇"; done }
  remaining() { for ((remain= (elapsed/factor) ; remain<(duration/factor) ; remain=remain+1)); do printf " "; done }
  percentage() { printf "| %s%%" $(( ((elapsed)*100)/(duration)*100/100 )); }
  clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
      already_done; remaining; percentage
      sleep "$SLEEP_DURATION"
      clean_line
  done
  clean_line
}


