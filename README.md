<p align="left">
  <h1 align="left">prompt_j2</h2>
  
  <a href="https://travis-ci.org/malinoskj2/prompt_j2">
    <img src="https://travis-ci.org/malinoskj2/prompt_j2.svg?branch=master"
      alt="CI" />
  </a>
  <a href="https://github.com/malinoskj2/prompt_j2/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/malinoskj2/prompt_j2.svg"
        alt="License" />
  </a>
  <a href="https://github.com/malinoskj2/prompt_j2/commits">
    <img src="https://img.shields.io/github/last-commit/malinoskj2/prompt_j2.svg"
      alt="Last Commit" />
  </a>

</p>

## Overview
My personal theme. Enjoy it. :smirk:<br />
Will be in a state of flux for a bit.

## Behavior

#### Dynamic exit status indicator
![exit_stat](https://media.giphy.com/media/4a7DAeH2kf7WyLNbqT/giphy.gif)
#### Expands to 2 lines to show context info (git, TODO: ssh)
![ctx_info](https://media.giphy.com/media/uTBjOYYzWe4oGn5hYN/giphy.gif)
#### Past prompts still only burn 1 line when prompt is expanded to 2
![ctx_info](https://media.giphy.com/media/BpDg5nTFouC7He0Dit/giphy.gif)

##### Can set an "idle function"
- This is a function that will be called when the tty has been idle for some time.
```
# Terminal will exit if no prompts in 60 min
IDLE_FUNC=exit  
IDLE_FUNC_TIMER=3600 
```
## Testing
```
1. Clone the repo
2. cd into the root directory of project 
3. execute ./tests/run_all.sh
```


## todo
```
1. Support ssh
2. Check against remote git repo branch asynchronously
3. ???
```
## Install
```
1. Clone the repo: 
   git clone --recurse-submodules https://github.com/malinoskj2/prompt_j2.git
2. source prompt_loader in your .zshrc
```

