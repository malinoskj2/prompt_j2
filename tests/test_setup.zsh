#!/usr/bin/env zsh

# tests for prompt_j2_loader

# sh unit needs
setopt shwordsplit
SHUNIT_PARENT=$0

# SETUP

oneTimeSetUp() {
  SCRIPT_DIR=${0:a:h}
  
  source $SCRIPT_DIR/lib/prompt_j2_setup # &> /dev/null
  source $SCRIPT_DIR/lib/prompt_j2_vcs # &> /dev/null

  init_globals # Set global variables
  init_vcs     # set vcs_info formatting
  comp_prompt_variants # compute parts of prompt
}

# TEST

testGlobalsSet(){
  assertNotNull  $NAME_OUTR_LEFT
  assertNotNull  $NAME_OUTR_RIGHT
  assertNotNull  $NAME_OUTR_COLOR
  assertNotNull  $DEF_OUT
  assertNotNull  $SUCC_OUT
  assertNotNull  $FAIL_OUT
  assertNotNull  $STAT_IND_LEN
  assertNotNull  $IDLE_FUNC
  assertNotNull  $IDLE_FUNC_TIMER
  assertNotNull  $DIR_SYM
  assertNotNull  $DCOLOR
  assertNotNull  $BRANCH_SYM
  assertNotNull  $PAST_CMD_COLOR
}

testRunVcsScript(){
  local vcs_string="$(run_vcs_script [ ] $BRANCH_SYM)"

  assertNotNull "$vcs_string"
  assertContains "$vcs_string" "$BRANCH_SYM"
}

testCompPrompVars(){


  assertContains "$PTR_SUCC" "$SUCC_OUT"
  assertNotEquals "$PTR_SUCC" "$SUCC_OUT"
  assertNotContains "$(print -Pn $PTR_SUCC)" "%"

  assertContains    "$PTR_FAIL" "$FAIL_OUT"
  assertNotEquals   "$PTR_FAIL" "$FAIL_OUT"
  assertNotContains "$(print -Pn $PTR_FAIL)" "%"

  assertContains    "$NAME_SEC" "$NAME_OUTR_LEFT"
  assertNotEquals   "$NAME_SEC" "$NAME_OUT_LEFT"
  assertNotContains "$(print -Pn $NAME_SEC)" "%"
  assertContains    "$NAME_SEC" "$NAME_OUTR_RIGHT"
  assertNotEquals   "$NAME_SEC" "$NAME_OUT_RIGHT"
  assertNotContains "$(print -Pn $NAME_SEC)" "%"
}

testSetDyn(){
  set_dyn

  assertContains "$PS1" "$NAME_SEC"
  assertNotContains "$PS1" "%"
  assertNotContains "$PS1" "red"
  assertNotContains "$PS1" "green"
  assertNotContains "$PS1" "{"
  assertNotContains "$PS1" "}"
}

testSetDyn(){
  set_stat

  assertContains "$PS1" "$NAME_SEC"
  assertContains "$PS1" "$DEF_OUT"
}

testSetMin(){
  set_minimal
  assertContains "$PS1" "$DEF_OUT"
}

testComposePs1(){
  compose_ps1

  assertContains "$PS1" "$NAME_SEC"
  assertNotContains "$PS1" "red"
  assertNotContains "$PS1" "green"

}

testSchedDynExit(){
  sched_dyn_exit
  assertEquals "1" "$#zsh_scheduled_events"
}

testKillOutstandinScheds(){
  kill_outstanding_scheds
  assertEquals "0" "$#zsh_scheduled_events"
}



# run the tests
source ./mod/shunit2/shunit2