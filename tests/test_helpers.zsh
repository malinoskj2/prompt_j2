#!/usr/bin/env zsh
autoload -U colors && colors

setopt shwordsplit
SHUNIT_PARENT=$0

source ../prompt_j2_helpers

testColor() {
  print -Pn "%{$fg[${2}]%}${1}%{$reset_color%}"
  assertEquals "$(color "test" red )" "${fg[red]}test${reset_color}"
}

testColoredLen() {
  local word=test
  local word_len=$#word
  assertEquals 4 $word_len

  colored_word="$(color "test" red)"
  local c_word_len=$#{colored_word}
  assertNotEquals 4 "$#c_word_len"
}

testTimeUpdate() {
   local cur=$(print -Pn '[%D{%L:%M:%S %p}]')
   sleep 1
   local new=$(get_time)
   assertNotEquals "$cur" "$new"
}

source ../mod/shunit2/shunit2


