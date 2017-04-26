#!/usr/bin/env bats

source ./progress-bar.sh

@test "missing duration: do nothing" {
  run progress-bar

  [[ $status == 0 ]]
  [[ "${lines[0]}" == $(printf "\r") ]]
}

@test "1sec:" {
  run progress-bar 1

  [[ $status == 0 ]]
  [[ "$output" == $(printf "▇| 100%%\r\r") ]]
}
