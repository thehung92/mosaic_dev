# log of the command to build the lib

## install the required lib

```R
install.package('ff')
install.packages('LaF')
# build lib shortcut
# 
```

Description       Windows & Linux     Mac
Build and Reload  Ctrl+Shift+B        Cmd+Shift+B
Load All          Ctrl+Shift+L        Cmd+Shift+L
Test Package      Ctrl+Shift+T        Cmd+Shift+T
Check Package     Ctrl+Shift+E        Cmd+Shift+E
Document Package  Ctrl+Shift+D        Cmd+Shift+D

## start with change the upstream

```shell
# list all the remote stream
git remote -v
# save the current edit with all of the history
git add .
git commit -m 'first commit after fork'
git branch -M main # this will rename branch 'master' to branch 'main'
# add a remote repos
git remote add dev https://github.com/thehung92/mosaic_dev.git
git push -u dev main # this will push branch main to dev remote

```

## add help page for function in the library

```R


```