#!/usr/bin/env zsh

# tests for prompt_j2_loader

# sh unit needs
setopt shwordsplit
SHUNIT_PARENT=$0


# SETUP

oneTimeSetUp() {
  source ../prompt_j2_loader &> /dev/null
}

# TEST

testFilesExist(){
  assertTrue 'couldnt read' "[ -r ${0:a:h}/../mod/zsh-async/async.zsh ]"
  assertTrue 'couldnt read' "[ -r ${0:a:h}/../mod/zsh-autosuggestions/zsh-autosuggestions.zsh ]"
  assertTrue 'couldnt read' "[ -d ${0:a:h}/../mod/shunit2 ]"
  assertTrue 'couldnt read' "[ -r ${SCRIPT_DIR}/prompt_j2_helpers ]"
  assertTrue 'couldnt read' "[ -r ${SCRIPT_DIR}/prompt_j2_vcs ]"
  assertTrue 'couldnt read' "[ -r ${SCRIPT_DIR}/../prompt_j2_loader ]"
  assertTrue 'couldnt read' "[ -r ${SCRIPT_DIR}/prompt_j2_setup ]"
  assertTrue 'couldnt read' "[ -r ${0:a:h}/../README.md ]"
}

testThemeSet(){
  assertEquals "$zprompt_theme" "j2"
}

testFPathFuncs(){
  assertContains "$fpath" "Zle"
  assertContains "$fpath" "VCS_Info"
}

testAsyncOn(){
  assertEquals "$ZSH_AUTOSUGGEST_USE_ASYNC" "true"
}

# run the tests
source ../mod/shunit2/shunit2