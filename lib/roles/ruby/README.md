ruby recipe for itamae
===
- install rbenv with some plugins and ruby

## description
This recipe is to install rbenv, rbenv-plugins and ruby, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
- install [rbenv](https://github.com/sstephenson/rbenv.git "rbenv") to user's home directory using git.
- install [ruby-build](https://github.com/sstephenson/ruby-build.git) and [default-gems](https://github.com/sstephenson/rbenv-default-gems.git "default-gems"), these are rbenv plugins, to installed rbenv using git too.
- install ruby which version is specified by **ruby_version** using ruby-build.

## attributes
- **ruby_version**: ruby version that you want to use

for examples (yaml)
``` yaml
ruby_version: 2.1.3
```
by default
``` yaml
ruby_version: 2.2.0
```

## depend on
- git
