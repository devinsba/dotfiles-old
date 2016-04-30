# dotfiles and similar types of things

Bootstrap:
```
curl https://raw.githubusercontent.com/devinsba/dotfiles/master/bootstrap/bootstrap.zsh | zsh
```

## Add variables before init

Create a file called `~/.zshrc.local` within which you can export variables to use elsewhere

### Existing variables

`DOCKER_BETA`- Disables initializing the environment for the old Docker toolbox docker machine
