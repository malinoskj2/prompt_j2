# prompt_j2
```
A prompt theme for Zsh.
```
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
- This is a function that will be calle when the tty has been idle for some time.
ex.
```
# Terminal will exit if no prompts in 60 min
IDLE_FUNC=exit IDLE_FUNC_TIMER=3600 
```
## todo
```
1. Support ssh
2. Show additional git info
3. Check against remote git repo branch asynchronously
4. ???
```
## Install
```
1. Clone the repo: 
   git clone https://github.com/malinoskj2/prompt_j2.git
2. source prompt_loader in your .zshrc
```
