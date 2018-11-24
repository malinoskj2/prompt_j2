#!/usr/bin/env zsh

# tests for prompt_j2_vcs

# sh unit needs
setopt shwordsplit
SHUNIT_PARENT=$0

source ../prompt_j2_vcs

# TESTS

testInsideRepo(){
  assertTrue "[ inside_git_repo ]"
}

testStartMessage(){
  local start_message=$(start_message "test")
  assertEquals "$start_message" "test"
}

testRunVcs(){
  local BRANCH_SYM=⎇

  init_vcs

  local vcs_string=$(run_vcs [ ] $BRANCH_SYM)

  assertNotContains "$vcs_string" "green"
  assertNotContains "$vcs_string" "red"
  assertNotContains "$vcs_string" "%"
  assertContains    "$vcs_string" "test"
}


# run the tests
source ../mod/shunit2/shunit2