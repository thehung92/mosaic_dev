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
git commit -m 'rm the *.Rproj from cached'
git branch -M main # this will rename branch 'master' to branch 'main'
# add a remote repos
git remote add dev https://github.com/thehung92/mosaic_dev.git
git push -u dev main # this will push branch main to dev remote
# git remote rm origin
git remote rm origin

#### unstage a file ####
# unstage 1 file
git reset HEAD -- mosaic.Rproj
# unstage all file
git reset

#### remove a file from cached ####
# also remove file in previous commit
git rm --cached -r mosaic.Rproj
#### view all the log ####
git log --pretty=oneline --abbrev-commit`
```

## add help page for function in the library with devtools and roxygen2

```r
# start with documenting in a nice README.md
usethis::use_readme_md()
```
Documenting functions with roxygen2

- delete `NAMESPACE`. this cause an error that can be resolved with `devtools::document()` ; other ways `roxygen2::roxygenize()`; Rstudio Cmd+shift+D
- delete the `man/` dir
- from the upper-right panel: build > more > configure build tools > generate documentation with roxygen > install and restart

Place cursor in the function

- from the menu: code > insert roxygen skeleton
- resolve bugs by replacing `compiler::cmpfun` with `cmpfun`
