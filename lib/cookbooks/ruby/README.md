ruby recipe
===
- install rbenv
- install rbenv-plugins
- install ruby on rbenv

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install rbenv, rbenv-plugins and ruby.
- install [rbenv](https://github.com/sstephenson/rbenv.git "rbenv") to user's home directory using git.
- install [ruby-build](https://github.com/sstephenson/ruby-build.git) and [default-gems](https://github.com/sstephenson/rbenv-default-gems.git "default-gems"), these are rbenv plugins, to installed rbenv using git too.
- install ruby which version is specified by **ruby_version** using ruby-build.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
ruby:
- version: 2.2.2 # ruby version that you want to use
```

## depend on
- git
