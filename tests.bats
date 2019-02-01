#!/usr/bin/env bats

source ./progress-bar.sh

SLEEP_DURATION=.01
export SLEEP_DURATION


@test "show nothings when no duration provided" {
  run progress-bar

  [[ $status == 0 ]]
  [[ "${lines[0]}" == $(printf "\r") ]]
}

@test "show progress-bar when given duration" {
  run progress-bar 1

  [[ $status == 0 ]]
  [[ "$output" == $(printf "▇| 100%%\r\r") ]]
}

@test "show multiple blocks on one line" {
  run progress-bar 2

  echo "$output" > /tmp/bats
  [[ $status == 0 ]]
  [[ "$output" == $(printf "▇ | 50%%\r▇▇| 100%%\r\r") ]]
}
